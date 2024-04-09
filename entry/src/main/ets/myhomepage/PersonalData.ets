import router from '@ohos.router';
import inputMethod from '@ohos.inputMethod';
import UserBean from '../common/bean/UserBean';
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
@CustomDialog
struct DialogTow {
  @State userBean:UserBean = new UserBean();
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
              if (this.name_0 == '昵称'){
                this.userBean.setNickName(this.inputValue)
                console.info(this.userBean.getNickName())
              }else if (this.name_0 == '签名'){
                this.userBean.setSignature(this.inputValue)
                console.info(this.userBean.getSignature())
              }
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
struct PersonalData{
  @State userBean:UserBean = new UserBean();
  @State nickname:string = this.userBean.getNickName()//昵称
  @State signature:string = this.userBean.getSignature();//签名
  @State sex:string = '女';//性别
  @State select: number = 0
  private sex_list: string[] = ['女', '男']
  @State selectedDate: Date = new Date("2024-4-10")
  @State selectedTime:string = "2024-4-10"

  @State textValue: string = ''
  @State mailbox: string = '3159305130@qq.com'
  @State phone: string = '12345678912'
  @State address: string = '江西环境工程职业学院'


  nicknameController: CustomDialogController = new CustomDialogController({
    builder: DialogTow({
      name_0:'昵称',
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      inputValue: $nickname
    }),
    cancel: this.exitApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })//昵称
  signatureController: CustomDialogController = new CustomDialogController({
    builder: DialogTow({
      name_0:'签名',
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      inputValue: $nickname
    }),
    cancel: this.exitApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })//签名
  addressController: CustomDialogController = new CustomDialogController({
    builder: Dialog({
      name_0:'住址',
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      inputValue: $address
    }),
    cancel: this.exitApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })//住址
  phoneController: CustomDialogController = new CustomDialogController({
    builder: Dialog({
      name_0:'手机号',
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      inputValue: $phone
    }),
    cancel: this.exitApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })//手机号
  mailboxController: CustomDialogController = new CustomDialogController({
    builder: Dialog({
      name_0:'邮箱',
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      inputValue: $mailbox
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
    this.addressController = null // 将dialogController置空
    this.phoneController = null
    this.mailboxController = null
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


  build(){
    Column(){
        Row() {
          Image($r('app.media.return_key'))
            .margin({ top: 25, left: 5 })
            .width(30)
            .height(27)
            .onClick(()=>{
              router.back();//返回上一级
            })
          Text('个人资料')
            .fontSize(28)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 25, left: '50%' })
        }
        .width('95%')
        Shape() {
          Rect().width('95%').height(160).fill('#262729')
          .radius(25)
          .opacity(0.4)
          Column() {
            Row() {
              Text('头像')
                .fontSize(22)
                .fontColor(Color.White)
                .margin({left:10})
              Row() {
                Image($r('app.media.user_avtar1'))
                  .width(56)
                  .height(56)
                  .borderRadius(28)
                Image($r('app.media.right'))
                  .width(38)
                  .height(38)
              }
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .width('95%')
            .height(80)

            Divider().width('95%').color('#838383')
            Row() {
              Text('签名')
                .fontSize(22)
                .fontColor(Color.White)
                .margin({left:10})
              Row() {
                Text(`${this.signature}`)
                  .fontSize(18)
                  .fontColor(Color.White)
                  .lineHeight(20)
                  .width('35%')
                  .height(40)
                Image($r('app.media.right'))
                  .width(38)
                  .height(38)
              }
            }
            .onClick(()=>{
              this.signatureController.open()
            })
            .justifyContent(FlexAlign.SpaceBetween)
            .width('95%')
            .height(80)
          }
        }
      .margin({top:20})
      Shape() {
        Rect().width('95%').height(240).fill('#262729')
          .radius(25)
          .opacity(0.4)
        Column() {
          Row() {
            Text('昵称')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({left:10})
            Row() {
              Text(`${this.nickname}`)
                .fontSize(18)
                .fontColor(Color.White)
              Image($r('app.media.right'))
                .width(38)
                .height(38)
            }
          }
          .onClick(()=>{
            this.nicknameController.open()
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
          Divider().width('95%').color('#838383')
          Row() {
            Text('性别')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({left:10})
            Row() {
              Text(`${this.sex}`)
                .fontSize(18)
                .fontColor(Color.White)
              Image($r('app.media.right'))
                .width(38)
                .height(38)
            }
          }
          .onClick(() => {
            TextPickerDialog.show({
              range: this.sex_list,
              selected: this.select,
              onAccept: (value: TextPickerResult) => {//确定
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                this.sex = value.value
              },
              onCancel: () => {//取消
                console.info("性别取消选择")
              },
              onChange: (value: TextPickerResult) => {//选择
                console.info("性别当前选择" + JSON.stringify(value))
              }
            })
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
          Divider().width('95%').color('#838383')
          Row() {
            Text('生日')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({left:10})
            Row() {
              Text(`${this.selectedTime}`)
                .fontSize(18)
                .fontColor(Color.White)
              Image($r('app.media.right'))
                .width(38)
                .height(38)
            }
          }
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date("2000-1-1"),
              end: new Date("2100-12-31"),
              selected: this.selectedDate,
              onAccept: (value: DatePickerResult) => {
                // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                this.selectedDate.setFullYear(value.year, value.month, value.day)
                this.selectedTime = String(value.year)+'-'+String(value.month+1)+'-'+String(value.day)
                console.info(this.selectedTime)
              },
              onCancel: () => {
                console.info("DatePickerDialog:onCancel()")
              },
              onChange: (value: DatePickerResult) => {
                console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
              }
            })
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
        }
      }
      .margin({top:20})
      Shape() {
        Rect().width('95%').height(240).fill('#262729')
          .radius(25)
          .opacity(0.4)
        Column() {
          Row() {
            Text('邮箱')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({left:10})
            Row() {
              Text(`${this.mailbox}`)
                .fontSize(18)
                .fontColor(Color.White)
              Image($r('app.media.right'))
                .width(38)
                .height(38)
            }
          }
          .onClick(()=>{
            this.mailboxController.open()
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
          Divider().width('95%').color('#838383')
          Row() {
            Text('手机号')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({left:10})
            Row() {
              Text(`${this.phone}`)
                .fontSize(18)
                .fontColor(Color.White)
              Image($r('app.media.right'))
                .width(38)
                .height(38)
            }
          }
          .onClick(()=>{
            this.phoneController.open()
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
          Divider().width('95%').color('#838383')
          Row() {
            Text('住址')
              .fontSize(22)
              .fontColor(Color.White)
              .margin({left:10})
            Row() {
              Text(this.address)
                .fontSize(18)
                .fontColor(Color.White)
              Image($r('app.media.right'))
                .width(38)
                .height(38)
            }
          }
          .onClick(()=>{
            this.addressController.open()
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')
          .height(80)
        }
      }
      .margin({top:20})
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }

}