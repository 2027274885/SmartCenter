import DeviceBean from '../common/bean/DeviceBean';
import MainViewModel from '../model/MainViewModel';
@Entry
@Component
struct DeviceStatus{
  @State deviceBean:DeviceBean = null;
  private timerId:number = 0;//计时器id，每5秒读取一次数据

  build(){
    Column(){
      Row(){
        Text('设备状态')
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
          .margin({top:10})
      }
      Divider().width('95%')
      Row(){
        Text('设备ID：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('dev01')
        Text(`${this.deviceBean.deviceId}`)//从变量读取数据
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      Row(){
        Text('设备名：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('jerry的设备')
        Text(`${this.deviceBean.name}`)
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      Row(){
        Text('室内温度：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('22.5℃')
        Text(`${this.deviceBean.temperator}℃`)//从变量读取数据
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      Row(){
        Text('室内湿度：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('5.14RH')
        Text(`${this.deviceBean.humidity}RH`)//从变量读取数据
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      Row(){
        Text('光照强度：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('777Lux')
        Text(`${this.deviceBean.lumination}Lux`)//从变量读取数据
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      Row(){
        Text('下雨预警：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('无')
        Text(`${this.deviceBean.isRain===0?'无':'有雨'}`)
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      Row(){
        Text('烟雾报警：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('正常')
        Text(`${this.deviceBean.isSmoke===0?'无':'报警中...'}`)
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      Row(){
        Text('火灾报警：')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        // Text('正常')
        Text(`${this.deviceBean.isFire===0?'无':'报警中...'}`)
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐

    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.index_background'))
    .backgroundImageSize(ImageSize.Cover)
  }
  loadDeviceData(){
    this.deviceBean = MainViewModel.getDeviceData(1)
  }
  aboutToAppear(){
    //当页面出现时获取设备数据
    this.loadDeviceData();
    //每隔5秒加载一次数据
    this.timerId = setInterval(()=>{
      this.loadDeviceData();
    },3000)
  }

}