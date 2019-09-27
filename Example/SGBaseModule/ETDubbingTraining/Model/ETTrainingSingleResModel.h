//
//  ETTrainingSingleResModel.h
//  SGBaseModule_Example
//
//  Created by SG on 2019/9/16.
//  Copyright © 2019 SG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETTrainingSingleResModel : NSObject

/** 资料id */
@property (nonatomic, strong) NSString *ResCode;
/** 资料名称 */
@property (nonatomic, strong) NSString *ResName;
/** 资料图标 */
@property (nonatomic, strong) NSString *IconPath;
/** 资源格式 听力训练：1-词汇（听写模式），2-篇章（听写模式），3-听力选择（听力选择模式） 口语训练：1-朗读，2-跟读，1|2-朗读|跟读，3-配音 */
@property (nonatomic, strong) NSString *ResType;
/** 资源来源（V2增加） */
@property (nonatomic, strong) NSString *Source;
/** 训练模式 听力训练：1-听写，2-听力选择 口语训练：1-跟读/朗读，3-配音 */
@property (nonatomic, strong) NSNumber *TrainMode;
/** 训练系统标识(V2增加，1-听力，2-口语，3-阅读，4-写作) */
@property (nonatomic, strong) NSNumber *SkillType;
/** 入库时间 */
@property (nonatomic, strong) NSString *StoreDate;
/** 专题编码 */
@property (nonatomic, strong) NSString *SpecicalCode;
/** 专题文本 */
@property (nonatomic, strong) NSString *SpecicalName;
/** 主题编码 */
@property (nonatomic, strong) NSString *ThemeCode;
/** 主题文本 */
@property (nonatomic, strong) NSString *ThemeText;
/** 重要知识点编码 */
@property (nonatomic, strong) NSString *ImporKnCode;
/** 重要知识点文本 */
@property (nonatomic, strong) NSString *ImporKnText;
/** 主要知识点编码 */
@property (nonatomic, strong) NSString *MainKnCode;
/** 主要知识点文本 */
@property (nonatomic, strong) NSString *MainKnText;
/** 单位数（资料组成文件个数） */
@property (nonatomic, strong) NSString *UnitNum;
/** 资源分类别 */
@property (nonatomic, strong) NSString *ResClass;
/** 所属水平级别 */
@property (nonatomic, strong) NSString *ResLevel;
/** 所属子库 */
@property (nonatomic, strong) NSString *LibCode;
/** 资源媒体文件FTP路径（多个用”|”隔开） */
@property (nonatomic, strong) NSString *ResFtpPath;
/** 资料音频路径 */
@property (nonatomic, strong) NSString *ResMediaPath;
/** 是否存在媒体文件（0无,1有） */
@property (nonatomic, strong) NSString *IsExsitMedia;
/** 资源下载状态 */
@property (nonatomic, strong) NSNumber *IsDownload;
/** 是否收藏了该资料 1代表已收藏、2：代表未收藏、3代表参数不合法、4代表token失效、-1代表系统异常 */
@property (nonatomic, strong) NSNumber *IsCollect;
/** 学习时长 */
@property (nonatomic, strong) NSString *StudyTime;
/** zip路径 */
@property (nonatomic, strong) NSString *ResZipPackFile;
/** 上传者 */
@property (nonatomic, strong) NSString *Uploadby;
/** 资源简介 */
@property (nonatomic, strong) NSString *ResDesc;
/** 资料列表内容 */
@property (nonatomic, strong) NSArray *Reslist;

@end

@interface ETTrainingVideoResModel : NSObject

/** 资源格式 */
@property (nonatomic, strong) NSString *ResType;
/** 正文英文原文 */
@property (nonatomic, strong) NSString *ResContent;
/** 正文中文翻译 */
@property (nonatomic, strong) NSString *ResTranContent;
/** 正文媒体资料路径、译文路径 */
@property (nonatomic, strong) NSString *ResMediaPath;
/** 媒体播放长度 */
@property (nonatomic, strong) NSString *ResMediaLength;
/** 媒体音频编码格式 */
@property (nonatomic, strong) NSString *AudioFormat;
/** 媒体视频编码格式 */
@property (nonatomic, strong) NSString *VideoFormat;
/** 正文每一段资源的相关数据（文本内容，播放开始时间，播放时长等 */
@property (nonatomic, strong) NSArray *VideoTrainSynInfo;

@end

@interface ETTrainingVideoModel : NSObject

/** 句子ID */
@property (nonatomic, strong) NSString *SenID;
/** 原文句子ID */
@property (nonatomic, strong) NSString *OrgID;
/** 译文句子ID */
@property (nonatomic, strong) NSString *TraID;
/** 起点时间 */
@property (nonatomic, strong) NSString *Starttime;
/** 持续时长 */
@property (nonatomic, strong) NSString *Timelength;
/** 英文文本 */
@property (nonatomic, strong) NSString *Ehtml;
/** 中文文本 */
@property (nonatomic, strong) NSString *Chtml;
/** 英文字幕 */
@property (nonatomic, strong) NSString *Etext;
/** 中文字幕 */
@property (nonatomic, strong) NSString *Ctext;

@property (nonatomic, strong) NSString *StuAnswer;

@property (nonatomic, strong) NSNumber *StuScore;
/** 流利度（V2增加） */
@property (nonatomic, strong) NSNumber *Fluent;
/** 准确度（V2增加） */
@property (nonatomic, strong) NSNumber *Accuracy;
/** 完整度（V2增加） */
@property (nonatomic, strong) NSNumber *Completion;
/** 韵律性（V2增加） */
@property (nonatomic, strong) NSNumber *Rhythm;
/** 学生作答每个单词的得分 */
@property (nonatomic, strong) NSArray *StuAnswerWordList;

@end

@interface ETTrainingSingleWordsResultModel : NSObject

/** 单词 */
@property (nonatomic, strong) NSString *Word;
/** 得分 */
@property (nonatomic, strong) NSNumber *Score;

@end

NS_ASSUME_NONNULL_END
