import { InfoItem, MineItemList } from '../model/MineItemList';
@Entry
@Component
export struct MineComponent{
  @State nickname:string = '金克斯';//昵称
  @State signature:string = '来一发轰轰烈烈的开场吧';//签名
  build(){
    Column() {
      Image($r('app.media.user_avtar1'))
        .width('100%')
        .height('25%')
        .opacity(0.5)
      Column() {
        Shape() {
          Circle({ width: 80, height: 80 }).fill('#3d3f46')
          Image($r('app.media.user_avtar1'))
            .width(68)
            .height(68)
            .margin({ top: 6, left: 6 })
            .borderRadius(34)
        }

        Text(this.nickname)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text(this.signature)
          .fontSize(14)
          .fontColor(Color.Orange)
      }
      .width('95%')
      .margin({ top: -34 })
      //功能列表
      Shape() {
        Rect()
          .width('100%')
          .height('28%')
          .fill('#3d3f46')
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
                      .margin({ left: 10 })
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
          // .height('100%')
          .margin({ top: '5%', left: '5%' })

        }
      }
      .margin({ top: 20 })
      .width('90%')
      Column(){
        Button('退出登录')
          .onClick(()=>{
            ''
          })
          .width('30%')
          .height(40)
          .margin({top:220})
          .fontColor(Color.White)
          .fontSize(20)
          .backgroundColor('#3d3f46')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}