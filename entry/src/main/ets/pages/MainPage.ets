import promptAction from '@ohos.promptAction';
import { TabID, TabItemList } from '../model/TabItem'
import { DeviceSearchComponent } from '../view/DeviceSearchComponent';
import HouseStateComponent from '../view/HouseStateComponent';
import { NotLogin } from '../view/NotLogin';
@Entry
@Component
struct MainPage {
  @State pageIndex:number = 0;//页面索引
  private tabController:TabsController = new TabsController();//tab切换控制器

  @Builder MyTabBuilder(idx:number){
    Column(){
      Image(idx === this.pageIndex ? TabItemList[idx].icon_selected:
      TabItemList[idx].icon)
        .width(32)
        .height(32)
        // .margin({top:5})
      Text(TabItemList[idx].title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.pageIndex === idx ? '#006eee':'#888')
    }
  }

  build() {
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        // Text('小屋状态')
        HouseStateComponent()
      }
      // .tabBar('小屋状态')
      .tabBar(this.MyTabBuilder(TabID.HOUSE)) //调用自定义的TabBar
      .onClick(()=>{
        promptAction.showToast({
          message:'请先登录!',
          duration:2000,
        })
      })
      TabContent(){
        // Text('搜索设备')
        DeviceSearchComponent()//调用设备搜索组件
      }
      .onClick(()=>{
        promptAction.showToast({
          message:'请先登录!',
          duration:2000,
        })
      })
      // .tabBar('搜索设备')
      .tabBar(this.MyTabBuilder(TabID.SEARCH_DEVICE)) //调用自定义的TabBar
      TabContent(){
        // Text('我的')
        // MineComponent();//个人主页
        NotLogin()
      }
      // .tabBar('我的')
      .tabBar(this.MyTabBuilder(TabID.MINE)) //调用自定义的TabBar
      .onClick(()=>{
        promptAction.showToast({
          message:'请先登录!',
          duration:2000,
        })
      })
    }
    .barWidth('100%')
    .barMode(BarMode.Fixed)
    .width('100%')
    .height('100%')
    .onChange((index)=>{//绑定onChange函数切换页签
      this.pageIndex = index;
    })
    .backgroundColor('#000')
  }
}