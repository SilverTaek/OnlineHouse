package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.QnaDto;


public interface QnaService {
	public List<QnaDto> selectAllQBoard();
	public QnaDto detailQBoard(int no);
	public boolean writeQBoard(QnaDto qna);
	public boolean updateQBoard(QnaDto qna);
	public boolean deleteQBoard(int no);
}
