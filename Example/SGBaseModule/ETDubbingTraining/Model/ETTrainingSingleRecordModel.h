//
//  ETTrainingSingleRecordModel.h
//  SGBaseModule_Example
//
//  Created by SG on 2019/9/16.
//  Copyright © 2019 SG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETTrainingSingleRecordModel : NSObject

/** 记录索引 */
@property (nonatomic, strong) NSNumber *ID;
/** 计划ID */
@property (nonatomic, strong) NSString *PlanID;
/** 用户ID */
@property (nonatomic, strong) NSString *UserID;
/** 班级ID */
@property (nonatomic, strong) NSString *ClassID;
/** 资料ID */
@property (nonatomic, strong) NSString *ResCode;
/** 资源格式(听力训练： 1-词汇（听写模式），2-篇章（听写模式），3-听力选择（听力选择模式）) */
@property (nonatomic, strong) NSString *ResType;
/** 资料名称 */
@property (nonatomic, strong) NSString *ResName;
/** 资源来源（V2增加） */
@property (nonatomic, strong) NSString *Source;
/** 资料音频路径 */
@property (nonatomic, strong) NSString *ResMediaPath;
/** 训练模式(听力训练：1-听写，2-听力选择) 口语训练：1-跟读，2-朗读，3-配音 */
@property (nonatomic, strong) NSNumber *TrainMode;
/** 学习模式（子模式） （听写）0-普通式，1-模考式 */
@property (nonatomic, strong) NSNumber *StudyMode;
/** 训练时长 */
@property (nonatomic, strong) NSNumber *StudyTime;
/** 训练等级 */
@property (nonatomic, strong) NSNumber *TrainLevel;
/** 训练得分 */
@property (nonatomic, strong) NSNumber *Score;
/** 每句播放次数 1-一次，2-两次，3-三次 */
@property (nonatomic, strong) NSNumber *Repeat;
/** 音频上次播放进度 （index） */
@property (nonatomic, strong) NSNumber *LastProgress;
/** 开始学习时间 */
@property (nonatomic, strong) NSString *StartTime;
/** 结束学习时间 */
@property (nonatomic, strong) NSString *EndTime;
/** 操作端 */
@property (nonatomic, strong) NSString *Operate;
/** 学期 */
@property (nonatomic, strong) NSString *Term;
/** 学生作答与资料同步信息列表 */
@property (nonatomic, strong) NSArray *StuAnswerTrainRecordList;
/** 记录总数 */
@property (nonatomic, strong) NSNumber *TotalCount;
/** 播放速度 0-慢，1-中，2-快 */
@property (nonatomic, strong) NSNumber *Speed;

@end

NS_ASSUME_NONNULL_END
