import router from '@ohos.router';
@Entry
@Component
struct HomeGate {
  @State isOn: boolean = true;
  build() {
    Column({ space: 20 }) {
      Row() {
        Image($r('app.media.return_key'))
          .margin({ top: 15, left: 5 })
          .width(30)
          .height(27)
          .onClick(()=>{
            router.back();//返回上一级
          })
        Text('大门状态')
          .fontSize(28)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 15, left: '50%' })
      }
      .width('95%')
      .height(60)
      Column() {
        if (this.isOn) {
          Shape() {
            Circle({ width: 300, height: 300 }).fill('#262729')
              .margin({ left: 0 })
              .opacity(0.5) //设置透明度
            Image($r('app.media.lock'))
              .margin({ top: 80, left: 100 })
              .height(140)
              .width(100)
          }
        } else {
          Shape() {
            Circle({ width: 300, height: 300 }).fill('#262729')
              .margin({ left: 0 })
              .opacity(0.5) //设置透明度
            Image($r('app.media.lock_1'))
              .margin({ top: 80, left: 100 })
              .height(140)
              .width(100)
          }
        }
        Row({ space: 50 }) {
          if (this.isOn) {
            Button('开锁')
              .onClick(() => {
                this.isOn = false
              })
          } else {
            Button('关锁')
              .onClick(() => {
                this.isOn = true;
              })
          }
        }
      }
      .height('80%')
      .width('95%')
      .justifyContent(FlexAlign.Center)
    }
    .height('100%')
    .width('100%')

    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}