@Entry
@Component
struct HomeGate {
  @State isOn: boolean = true;
  build() {
    Column({ space: 20 }) {
      if (this.isOn) {
        Shape() {
          Circle({ width: 300, height: 300 }).fill('#000000')
            .margin({left:0})
            .opacity(0.2)//设置透明度
          Image($r('app.media.lock'))
            .margin({top:80,left:100})
            .height(140)
            .width(100)
        }
      } else {
        Shape() {
          Circle({ width: 300, height: 300 }).fill('#000000')
            .margin({left:0})
            .opacity(0.2)//设置透明度
          Image($r('app.media.lock_1'))
            .margin({top:80,left:100})
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
        }else {
          Button('关锁')
            .onClick(() => {
              this.isOn = true;
            })
        }
      }
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r('app.media.index_background'))
    .backgroundImageSize(ImageSize.Cover)
  }
}