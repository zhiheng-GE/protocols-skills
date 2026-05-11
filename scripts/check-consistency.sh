#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"

python3 - <<'PY'
from pathlib import Path
import json
import re
import sys

root = Path('.')
public_buckets = ['engineering', 'productivity', 'misc']
private_buckets = ['personal', 'in-progress', 'deprecated']
errors = []

plugin_path = root / '.claude-plugin/plugin.json'
try:
    plugin = json.loads(plugin_path.read_text())
except Exception as exc:
    errors.append(f'无法解析 {plugin_path}: {exc}')
    plugin = {'skills': []}

plugin_skills = {p.removeprefix('./') for p in plugin.get('skills', [])}
readme = (root / 'README.md').read_text() if (root / 'README.md').exists() else ''

public = set()
for bucket in public_buckets:
    bucket_dir = root / 'skills' / bucket
    for skill_dir in sorted(bucket_dir.iterdir() if bucket_dir.exists() else []):
        if skill_dir.is_dir() and (skill_dir / 'SKILL.md').exists():
            public.add(str(skill_dir))

private = set()
for bucket in private_buckets:
    bucket_dir = root / 'skills' / bucket
    for skill_dir in sorted(bucket_dir.iterdir() if bucket_dir.exists() else []):
        if skill_dir.is_dir() and (skill_dir / 'SKILL.md').exists():
            private.add(str(skill_dir))

for skill in sorted(public):
    link = f'./{skill}/SKILL.md'
    if link not in readme:
        errors.append(f'顶层 README.md 缺少公开 skill 链接: {link}')
    if skill not in plugin_skills:
        errors.append(f'.claude-plugin/plugin.json 缺少公开 skill: ./{skill}')

for skill in sorted(private):
    if skill in plugin_skills:
        errors.append(f'私有/草稿/废弃 skill 不应出现在 plugin: ./{skill}')

extra_plugin = plugin_skills - public
for skill in sorted(extra_plugin):
    errors.append(f'plugin 中存在非公开 skill 或无效路径: ./{skill}')

for bucket in public_buckets + private_buckets:
    bucket_dir = root / 'skills' / bucket
    readme_path = bucket_dir / 'README.md'
    if not readme_path.exists():
        errors.append(f'缺少 bucket README: {readme_path}')
        continue
    bucket_readme = readme_path.read_text()
    dirs = {
        p.name for p in bucket_dir.iterdir()
        if p.is_dir() and (p / 'SKILL.md').exists()
    }
    links = set(re.findall(r'\]\(\./([^/]+)/SKILL\.md\)', bucket_readme))
    for name in sorted(dirs - links):
        errors.append(f'{readme_path} 缺少 skill 链接: {name}')
    for name in sorted(links - dirs):
        errors.append(f'{readme_path} 包含无效 skill 链接: {name}')

for skill_md in sorted(root.glob('skills/*/*/SKILL.md')):
    text = skill_md.read_text()
    if not text.startswith('---\n'):
        errors.append(f'{skill_md} 缺少 YAML frontmatter')
        continue
    try:
        _, fm, _ = text.split('---', 2)
    except ValueError:
        errors.append(f'{skill_md} frontmatter 格式错误')
        continue
    if not re.search(r'^name:\s*\S+', fm, re.M):
        errors.append(f'{skill_md} frontmatter 缺少 name')
    if not re.search(r'^description:\s*', fm, re.M):
        errors.append(f'{skill_md} frontmatter 缺少 description')

if errors:
    print('一致性检查失败：', file=sys.stderr)
    for err in errors:
        print(f'- {err}', file=sys.stderr)
    sys.exit(1)

print(f'一致性检查通过：公开 skills={len(public)}，plugin entries={len(plugin_skills)}')
PY
