package com.fh.entity;

import com.fh.util.PageData;
import lombok.Data;

import java.util.List;

/**
 * 说明：用户实体类
 * 创建人：Ajie
 * 创建时间：2019-10-16 11:09:33
 */
@Data
public class User {

    // 团队业绩
    private int TEAM_PERFORMANCE;
    // 1 表示已提现，0 表示未提现。每日0时 重置为0
    private int IS_WITHDRAW;
    // 手机号
    private String PHONE;
    // 密码
    private String PASSWORD;
    // 今天喂养
    private int FEEDING_TODAY;
    // 推荐人数
    private int RECOMMENDED_NUMBER;
    // 推荐人
    private int RECOMMENDER;
    // 推荐路径
    private String RE_PATH;
    // 昵称
    private String NICKNAME;
    // 1 表示领养，0 表示未领养
    private int IS_ADOPTION;









}
