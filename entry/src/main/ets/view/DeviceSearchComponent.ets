@Component
export struct DeviceSearchComponent {
  @State submitValue: string = '' //获取历史记录数据
  controller: SearchController = new SearchController()
  scroll: Scroller = new Scroller()
  @State historyValueArr: Array<string> = [] //历史记录存放
  private swiperController: SwiperController = new SwiperController()

  build() {
    Column({ space: 8 }) {
      Row({space:1}){
        Search({placeholder:'搜索一下',controller: this.controller})
          .searchButton('搜索')
          .margin(15)
          .width('80%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string) => { //绑定 输入内容添加到submit中
            this.submitValue = value

            for (let i = 0; i < this.historyValueArr.length; i++) {
              if (this.historyValueArr[i] === this.submitValue) {
                this.historyValueArr.splice(i, 1);
                break;
              }
            }
            this.historyValueArr.unshift(this.submitValue) //将输入数据添加到历史数据
            // 若历史记录超过10条，则移除最后一项
            if (this.historyValueArr.length > 10) {
              this.historyValueArr.splice(this.historyValueArr.length - 1);
            }

          })
        //二维码
        Scroll(this.scroll){
          Image($r('app.media.saomiao')).width(35).height(35)
            .objectFit(ImageFit.Contain)
        }
      }
      .margin({top:20})
      // 轮播图
      Swiper(this.swiperController) {
        Image($r('app.media.lunbotu1' ))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Auto)     //让图片自适应大小 刚好沾满
        // .backgroundImageSize(ImageSize.Cover)
        Image($r('app.media.lbt2' ))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Auto)
        Image($r('app.media.lbt3' ))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Auto)
        Image($r('app.media.lbt4' ))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Auto)
        Image($r('app.media.tips' ))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Auto)
      }
      .loop(true)
      .autoPlay(true)
      .interval(5000)    //每隔5秒换一张
      .width('90%')
      .height('25%')
      .borderRadius(20)
      // 历史记录
      Row() {
        // 搜索历史标题
        Text('搜索历史').fontSize('31lpx').fontColor("#828385")

        // 清空记录按钮
        Text('清空记录')
          .fontSize('27lpx').fontColor("#828385")
          // 清空记录按钮点击事件，清空历史记录数组
          .onClick(() => {
            this.historyValueArr.length = 0;
          })
      }
      .margin({top:30})
      // 设置Row组件的宽度、对齐方式和内外边距
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left: '37lpx',
        top: '11lpx',
        bottom: '11lpx',
        right: '37lpx'
      })

      // 使用Flex布局,包裹搜索历史记录
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
      }) {
        // 遍历历史记录数组,创建Text组件展示每一条历史记录
        ForEach(this.historyValueArr, (item: string, value: number) => {
          Text(item)
            .padding({
              left: '15lpx',
              right: '15lpx',
              top: '7lpx',
              bottom: '7lpx'
            })
              // 设置背景颜色、圆角和间距
            .backgroundColor("#EFEFEF")
            .borderRadius(10)
            // .margin('11lpx')
            .margin({top:5,left:20})
        })
      }
      // 设置Flex容器的宽度和内外边距
      .width('100%')
      .padding({
        top: '11lpx',
        bottom: '11lpx',
        right: '26lpx'

      })
    }
    .width('100%')
    .height('100%')
    // .backgroundColor('#f1f2f3')
    .backgroundImage($r('app.media.index_background1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}
// }