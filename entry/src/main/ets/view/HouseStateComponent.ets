import router from '@ohos.router';
import { Action } from '@ohos.multimodalInput.keyEvent';
import DeviceBean from '../common/bean/DeviceBean';
import MainViewModel from '../model/MainViewModel';
@Component
export default struct HouseStateComponent{
  @State handlePopup: boolean = false
  @Builder AddMenu(){
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Column(){
        Text('扫一扫')
          .fontSize(20)
          .width('100%')
          .height(30)
          .align(Alignment.Center)
        Divider().width('80%').color('#ccc')
        Text('添加设备')
          .fontSize(20)
          .width('100%')
          .height(30)
          .align(Alignment.Center)
      }
      .padding(5)
      .height(65)
    }.width(100)
  }
  build(){
    Column({space:8}){
      Row() {
        Text('小屋状态')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .margin({ top: 10 })
          .textAlign(TextAlign.Start)
        Image($r('app.media.jiahao_0'))
          .width(32)
          .height(32)
          .margin({top:10,left:160})
          .bindMenu(this.AddMenu())

        Image($r('app.media.news'))
          .fillColor(Color.Black)
          .width(32)
          .height(32)
          .margin({top:10})
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup,{
            message:'当前暂无未读消息',
          })
          // .onClick({
          //
          // })
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)
      Divider().width('95%').color(Color.White)

      Flex({ wrap: FlexWrap.Wrap }){
        Button()
        Row() {
          Shape() {
            Circle({ width: 60, height: 60 }).fill('#494848')
              .margin({left:15,top:'32%'})
              .opacity(0.7)
            Image($r('app.media.lock')).width(30)
              .margin({ left: 30 ,top:'42%'})
          }
          .height('100%')
          Column() {
            Text('大门')
              .fontSize(25)
              .fontColor('#838383')
              .fontWeight(FontWeight.Bold)
              .margin({ left: 20, top: 0 })
            Text('已锁')
              .fontSize(25)
              .fontColor('#838383')
              .fontWeight(FontWeight.Bold)
              .margin({ left: 20, top: 0 })
          }
        }
        .borderRadius(20)
        .backgroundColor('#1c1c1e')
        // .backgroundImage($r('app.media.Button_img'))
        // .backgroundImageSize(ImageSize.Cover)
        // .border({ width: 1 })
        // .borderColor('#b9b9b9')
        .width('47%')
        .height(160)
        .onClick(()=>{
          router.pushUrl({
            url:"house/HomeGate"
          })
        })
        Button()
        Row() {
          Shape() {
            Circle({ width: 60, height: 60 }).fill('#494848')
              .margin({left:15,top:'32%'})
              .opacity(0.7)
            Image($r('app.media.Device_icon')).width(30)
              .margin({ left: 30 ,top:'42%'})
          }
          .height('100%')
          Column() {
            Text('设备')
              .fontSize(25)
              .fontColor('#838383')
              .fontWeight(FontWeight.Bold)
              .margin({ left: 20, top: 0 })
            Text('状态')
              .fontSize(25)
              .fontColor('#838383')
              .fontWeight(FontWeight.Bold)
              .margin({ left: 20, top: 0 })
          }
        }
          .onClick(()=>{
            router.pushUrl({
              url:"house/DeviceStatus"
            })
          })
        .borderRadius(20)
        .backgroundColor('#1c1c1e')
        .margin({left:20})
        // .border({ width: 1 })
        // .borderColor('#b9b9b9')
        .width('47%')
        .height(160)
      }
      .width('95%')
      .padding(10)
      Flex() {
        Button()
        Row() {
          Shape() {
            Circle({ width: 60, height: 60 }).fill('#494848')
              .margin({ left: 15, top: '32%' })
              .opacity(0.7)
            Image($r('app.media.console_1')).width(30)
              .margin({ left: 30, top: '47%' })
          }
          .height('100%')

          Column() {
            Text('控制')
              .fontSize(25)
              .fontColor('#838383')
              .fontWeight(FontWeight.Bold)
              .margin({ left: 20, top: 0 })
            Text('面板')
              .fontSize(25)
              .fontColor('#838383')
              .fontWeight(FontWeight.Bold)
              .margin({ left: 20, top: 0 })
          }
        }
        .onClick(() => {
          router.pushUrl({
            url: "house/ControlConsole"
          })
        })
        .borderRadius(20)
        .backgroundColor('#1c1c1e')
        // .border({ width: 1 })
        // .borderColor('#b9b9b9')
        .width('47%')
        .height(160)
      }
      .width('95%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}