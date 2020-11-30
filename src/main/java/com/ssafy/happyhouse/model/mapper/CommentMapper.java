package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.CommentDto;

@Mapper
public interface CommentMapper {
	public List<CommentDto> selectCBoard(int qno);
	public CommentDto selectCBoardByNo(int cno);
	public int insertCBoard(CommentDto comment);
	public int updateCBoard(CommentDto comment);
	public int deleteCBoard(int cno);
}