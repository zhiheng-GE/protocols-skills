# Mocking 指南

Mock 是最后手段，不是默认工具。

## 可以 mock 的对象

可以 mock：

- 外部网络服务；
- 支付、邮件、短信等第三方系统；
- 时间、随机数；
- 很慢或不稳定的 I/O；
- 明确位于接缝处的适配器。

## 不要 mock 的对象

不要 mock：

- 被测模块的内部函数；
- 同一进程内的领域逻辑；
- 你真正想验证的行为；
- 只是为了让测试更容易而 mock 的协作者。

## 好 mock

好 mock 位于真实接缝：

```text
OrderService -> PaymentGateway interface -> FakePaymentGateway
```

测试仍然验证 `OrderService` 的真实行为。

## 坏 mock

坏 mock 复制实现结构：

```text
mock validateCart
mock calculateTax
mock persistOrder
assert each called once
```

这种测试只证明实现按当前方式拼接，不能证明用户行为正确。

## Fake 优先

如果可能，使用 fake/in-memory adapter 替代 mock：

- 更接近真实行为；
- 支持多步场景；
- 更少耦合调用次数；
- 更适合重构。

## 判断问题

如果你需要 mock 很多东西才能测试一个行为，先问：

- 接口是不是太浅？
- 是否缺少应用层 use-case？
- 副作用是否应该在一个适配器后面？
- 测试是否选错了入口？
