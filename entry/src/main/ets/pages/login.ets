
import router from '@ohos.router'
import image from '@ohos.multimedia.image'
import data from '@ohos.telephony.data'
import promptAction from '@ohos.promptAction'
@CustomDialog
struct LoginSave {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void
  build() {
    Column() {
      Text('是否将本次登录存储，方便下次快速登录').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('确定')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('取消')
          .onClick(() => {
            this.controller.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
  }
}
@Entry
@Component


struct Index {
  @State username:string = ''
  @State password:string = ''
  @State timeID:number =0
  @State userText:string = ''
  dialogControllerLogin: CustomDialogController = new CustomDialogController({
    builder: LoginSave({
      cancel: this.onCancel,
      confirm: this.onAccept,
    }),
    alignment: DialogAlignment.Default,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  onCancel() {
    console.info('确认保存')
    router.pushUrl({
      url:"pages/Loading"
    })
  }
  onAccept() {
    console.info('取消保存')
    router.pushUrl({
      url:"pages/Loading"
    })
  }

  build() {

    Column({space:20}){
      Text("登入页面")
        .fontSize(32)
        .fontColor("#01ffff")
      TextInput({placeholder:"请输入用户名",text:this.userText}).margin({top:20})
        .onChange((value)=>{
          this.username = value
        })
        .bindMenu([{
          value:'admin',
          action:()=>{
            this.userText = 'admin'
          }
        }])
      TextInput({ placeholder: '请输入密码' }).type(InputType.Password).margin({ top: 20 })
        .onChange((value)=>{
          this.password = value
        })
      Button('登入').width(150).margin({ top: 20 }).onClick(()=>{
        if (this.username == 'admin' && this.password=='123456'){
          this.dialogControllerLogin.open()
          promptAction.showToast({
            message: '登入成功',
            duration: 2000,
          })

        } else {
          // console.log("请登入");
          promptAction.showToast({
            message: '用户名或密码错误',
            duration: 2000,
          })
        }
      })
    }.padding(20)

    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r('app.media.housebg'))
    .backgroundImageSize(ImageSize.Cover)

    // .backgroundImageSize({width:'100%',height:'100%'})
  }
}