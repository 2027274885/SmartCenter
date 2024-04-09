import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { InfoItem, MineItemList } from '../model/MineItemList';
import HttpUtil from '../http/HttpUtil'
@CustomDialog
struct LoginSave {
  @State username:string = ''
  @State password:string = ''
  // @State userText:string = ''
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void
  build() {
    Column() {
      Text('请登入账号').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({placeholder:"请输入用户名"}).margin({top:20})
        .onChange((value)=>{
          this.username = value
        })
        // .bindMenu([{
        //   value:'admin',
        //   action:()=>{
        //     this.userText = 'admin'
        //   }
        // }])
      TextInput({ placeholder: '请输入密码' }).type(InputType.Password).margin({ top: 20 })
        .onChange((value)=>{
          this.password = value
        })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('登录')
          .onClick(() => {
            if (this.username == 'admin' && this.password=='123456') {

              promptAction.showToast({
                message: '登入成功',
                duration: 2000,
              })
            }
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
@Component
export struct NotLogin{
  @State nickname:string = '点击登陆';//昵称
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
      url:"pages/MainPages"
    })
  }
  onAccept() {
    console.info('取消保存')
  }
  build(){
    Column(){
      Image($r('app.media.mine1'))
      .width('100%')
      .height('25%')
      .opacity(0.5)
      Column() {
        Shape() {
          Circle({ width: 80, height: 80 }).fill('#3d3f46')
          Image($r('app.media.mine1'))
            .width(68)
            .height(68)
            .margin({top:6,left:6})
            .borderRadius(34)
        }
        Text(this.nickname)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .onClick(() => {
        this.dialogControllerLogin.open()

      })
      .width('95%')
      .margin({top:-34})
      //功能列表
      Shape() {
        Rect().width('100%').height('240').fill('#3d3f46')
        .radius(40)
        .opacity(0.5)
        Column() {
          List() {
            ForEach(MineItemList, (item: InfoItem) => {
              ListItem() {
                // Text(item.title)
                Row() {
                  Row() {
                    Image(item.icon)
                      .width(30)
                      .height(30)
                    Text(item.title)
                      .fontSize(22)
                      .fontColor(Color.White)
                      .margin({left:10})
                  }

                  Image($r('app.media.right'))
                    .width(38)
                    .height(38)
                }
                .width('100%')
                .height(52)
                .justifyContent(FlexAlign.SpaceBetween)
              }
              // .border({
              //   width: { bottom: 1 },
              //   color: Color.Orange
              // })
            }, item => JSON.stringify(item))
          }
          .margin(10)
          .border({
            radius: {
              topLeft: 24,
              topRight: 24
            }
          })
          // .backgroundColor('#115f7691')
          .width('95%')
          .height('100%')
          .margin({top:'5%',left:'5%'})
        }
      }
      .margin({top:20})
      .width('90%')
    }

    .width('100%')
    .height('100%')
    // .backgroundColor('#f1f2f3')
    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }

}