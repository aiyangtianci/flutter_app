enum MessageType { SYSTEM, PUBLIC, CHAT, GOUP }

class MessageData {
  //头像
  String avatar;

  //主标题
  String title;

//子标题
  String subTitle;

  DateTime time;

  MessageType type;

  bool selected =false;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

List<MessageData> messagedata = [
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201408/25/20140825154927_MYtM4.jpeg',
      '骚猪',
      '你有一条新的消息。',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201807/31/20180731152127_fctgj.jpg',
      '帅比',
      '帅比动漫头像一枚。',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201811/24/20181124133326_gnvqy.thumb.700_0.jpeg',
      '大头',
      '我姓胡，请叫我胡大头！！',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201710/21/20171021223447_VP3Sd.jpeg',
      'angle baby',
      '我姓杨，请叫我杨天宝！！哈哈~',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201805/25/20180525175518_dbyte.jpg',
      '唐三',
      '斗罗大陆里的史莱克七怪，只有我才是C位！',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201705/28/20170528214654_KHcRL.jpeg',
      '汤姆',
      '看过猫和老鼠吗？',
      DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201410/02/20141002204520_uZKvk.thumb.700_0.jpeg',
      '小迷妹',
      '矫情的一比',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201508/08/20150808153216_JWNFV.jpeg',
      '小清',
      '清新的风格',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201803/24/20180324081023_8FVre.jpeg',
      '阿冷',
      '高冷范`~~',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201803/04/20180304165637_RzBQW.thumb.700_0.jpeg',
      '卡哇伊',
      '下雪了啊！！',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201812/10/20181210163023_xXazM.thumb.700_0.jpeg',
      '阿喵',
      '我们一起学猫叫。',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://cdn.duitang.com/uploads/item/201411/22/20141122155437_mKLuK.thumb.700_0.jpeg',
      '米米',
      '闭眼一张很有感觉。。。',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201512/03/20151203101217_NdBsh.jpeg',
      'Kitty',
      'Hello Kitty~~',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201810/10/20181010102022_ztsye.thumb.700_0.jpeg',
      '阿旺',
      '喜欢喝旺仔牛奶`🥛',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://img3.duitang.com/uploads/item/201606/15/20160615045627_2TheV.jpeg',
      '阿一古',
      'Hello ~',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201601/04/20160104003348_5eui4.thumb.700_0.jpeg',
      '圣埃蒂安',
      'Hello啊 在不在~~',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201512/12/20151212152647_Cn2Rv.jpeg',
      '风儿',
      '风和日丽的天气下。。',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://cdn.duitang.com/uploads/item/201511/13/20151113172823_sLR2M.jpeg',
      '吃吃',
      '吃吃吃吃 ~',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201605/20/20160520192146_x3suY.jpeg',
      '喝喝',
      '喝喝喝喝喝~~',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201803/29/20180329184955_QdjNa.jpeg',
      '高冷',
      '看我胳膊上的伤疤没?。',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201702/25/20170225142651_8RfCe.jpeg',
      '仙儿',
      '像不像刘亦菲？',
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      'http://b-ssl.duitang.com/uploads/item/201610/15/20161015220939_hfN4t.jpeg',
      '撩儿',
      '这手指勾的啊。。。~~',
      new DateTime.now(),
      MessageType.CHAT),
];
