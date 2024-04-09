import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import UserBean from '../common/bean/UserBean';
import { InfoItem, MineItemList } from '../model/MineItemList';
@Entry
@Component
export struct MineComponent{
  @State userBean:UserBean = new UserBean()
  @State nickname:string = this.userBean.getNickName();//昵称
  @State signature:string = this.userBean.getSignature();//签名
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

        Text(`${this.nickname}`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text(`${this.signature}`)
          .fontSize(14)
          .fontColor(Color.Orange)
      }
      .width('95%')
      .margin({ top: -34 })
      //功能列表
      Shape() {
        Rect()
          .width('100%')
          .height(240)
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
                    if (item.title == '个人资料') {
                      Shape() {
                        Rect().width('80%').height(30)
                          .opacity(0)
                        Text(item.title)
                          .fontSize(22)
                          .fontColor(Color.White)
                          .margin({ left: 10 })
                      }
                      .onClick(() => {
                        router.pushUrl({
                          url:"myhomepage/PersonalData"
                        })
                      })
                    }else if (item.title == '账号与安全') {
                      Shape() {
                        Rect().width('80%').height(30)
                          .opacity(0)
                        Text(item.title)
                          .fontSize(22)
                          .fontColor(Color.White)
                          .margin({ left: 10 })
                      }
                      .onClick(() => {
                        router.pushUrl({
                          url:"myhomepage/AccountSecurity"
                        })
                      })
                    }else if (item.title == '检查更新') {
                      Shape() {
                        Rect().width('80%').height(30)
                          .opacity(0)
                        Text(item.title)
                          .fontSize(22)
                          .fontColor(Color.White)
                          .margin({ left: 10 })
                      }
                      .onClick(()=>{
                        promptAction.showToast({
                          message:"当前暂无更新",
                          duration:2000,
                        })
                      })
                    }else if (item.title == '关于') {
                      Shape() {
                        Rect().width('80%').height(30)
                          .opacity(0)
                        Text(item.title)
                          .fontSize(22)
                          .fontColor(Color.White)
                          .margin({ left: 10 })
                      }
                      .onClick(()=>{
                        promptAction.showToast({
                          message:"当前版本为1.0.0",
                          duration:2000,
                        })
                      })
                    }else{
                      Text(item.title)
                        .fontSize(22)
                        .fontColor(Color.White)
                        .margin({ left: 10 })
                    }
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
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}