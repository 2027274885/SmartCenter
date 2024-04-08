export interface TabItem {
  icon: Resource; //图标
  icon_selected: Resource;
  title: string;
  id: number;
}

export enum TabID {
  HOUSE,
  SEARCH_DEVICE,
  MINE
}

export const TabItemList: TabItem[] = [{
  icon: $r('app.media.house0'),
  icon_selected: $r('app.media.house1'),
  title: '我的小屋',
  id: TabID.HOUSE
},
  {
    icon: $r('app.media.search0'),
    icon_selected: $r('app.media.search1'),
    title: '查找设备',
    id: TabID.SEARCH_DEVICE,
  }, {
    icon: $r('app.media.mine0'),
    icon_selected: $r('app.media.mine1'),
    title: '个人主页',
    id: TabID.MINE
  }
]
