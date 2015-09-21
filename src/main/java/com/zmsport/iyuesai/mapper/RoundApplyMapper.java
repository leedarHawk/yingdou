package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 球局申请mapper
 * @author bilei
 *
 */
public interface RoundApplyMapper {
	
	/**
	 * 某球局所有申请
	 * @param rid
	 * @return
	 */
	public List<RoundApply> getAllRoundApplys(long rid);
	
	/**
	 * 获取球局申请信息
	 * @param id
	 * @return
	 */
	public RoundApply getRoundApplyById(long id);
	
	/**
	 * 获取某一球局申请信息
	 * @param uid
	 * @param rid
	 * @return
	 */
	public RoundApply getRoundApplyByUidAndRid(long uid, long rid);
	
	/**
	 * 获取某一球局的申请信息列表
	 * @param rid
	 * @return
	 */
	public List<RoundApply> getRoundApplyRid(long rid);
	
	/**
	 * 申请
	 * @param ra
	 */
	public void insert(RoundApply ra);
	
	/**
	 * 更新状态
	 * @param status
	 * @param id
	 */
	public void updateStatus(int status, long id);
	
	/**
	 * 获取某用户的球局申请
	 * @param uid
	 * @return
	 */
	public List<RoundApply> getRoundApplyByUid(long uid);

}
