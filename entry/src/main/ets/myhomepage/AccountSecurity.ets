import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@CustomDialog
struct Dialog {
  @Link textValue: string
  @Link inputValue: string
  @State name_0:string = ''
  controller?: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在所有controller的后面
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  build() {
    Column() {
      Text(`请输入新的${this.name_0}：`).fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '' }).height(60).width('90%')
        .onChange((value: string) => {
          this.textValue = value
        })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('确认')
          .onClick(() => {
            if (this.controller != undefined) {
              this.inputValue = this.textValue
              this.controller.close()
              this.confirm()
            }
          }).backgroundColor(Color.White).fontColor(Color.Blue)
        Button('取消')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(Color.White).fontColor(Color.Red)
      }.margin({ bottom: 10 })

      .margin(20)
    }.borderRadius(10)
  }
}

@Entry
@Component
struct AccountSecurity {
  @State textValue: string = ''
  @State password:string = '123456'
  passwordController: CustomDialogController = new CustomDialogController({
    builder: Dialog({
      name_0:'密码',
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      inputValue: $password
    }),
    cancel: this.exitApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })//邮箱

  // 在自定义组件即将析构销毁时将dialogControlle置空
  aboutToDisappear() {
    this.passwordController = null
  }
  onAccept() {
    console.info('单击第一个按钮时回调')
  }

  onCancel() {
    console.info('单击第二个按钮时回调')
  }

  exitApp() {
    console.info('单击空白处的回呼')
  }
  build() {
    Column() {
      Row() {
        Image($r('app.media.return_key'))
          .margin({ top: 15, left: 5 })
          .width(30)
          .height(27)
          .onClick(() => {
            router.back(); //返回上一级
          })
        Text('账号与安全')
          .fontSize(28)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 15, left: '50%' })
      }.width('95%')

      Shape() {
        Rect()
          .width('95%')
          .height(240)
          .fill('#262729')
          .radius(40)
          .opacity(0.4)
        Column() {
          Row() {
            Text('当前登录环境')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({ left: 10 })
            Image($r('app.media.right'))
              .width(38)
              .height(38)
          }
          .onClick(()=>{
            promptAction.showToast({
              message:'当前安全环境:安全',
              duration:2000,
            })
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
          Divider().width('95%').color(Color.White)
          Row() {
            Text('修改密码')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({ left: 10 })
            Image($r('app.media.right'))
              .width(38)
              .height(38)
          }
          .onClick(()=>{
            this.passwordController.open()
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
          Divider().width('95%').color(Color.White)
          Row() {
            Text('退出登录')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({ left: 10 })
            Image($r('app.media.right'))
              .width(38)
              .height(38)
          }
          .onClick(()=>{
            router.pushUrl({
              url:"pages/MainPage"
            })
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
        }
      }
      .margin({top:15})
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}