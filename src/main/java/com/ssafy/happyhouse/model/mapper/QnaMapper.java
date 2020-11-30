package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.QnaDto;

@Mapper
public interface QnaMapper {
	public List<QnaDto> selectQBoard();
	public QnaDto selectQBoardByNo(int no);
	public int insertQBoard(QnaDto qna);
	public int updateQBoard(QnaDto qna);
	public int deleteQBoard(int no);
}