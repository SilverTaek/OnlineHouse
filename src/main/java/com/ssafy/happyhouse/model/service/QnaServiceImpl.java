package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.QnaDto;
import com.ssafy.happyhouse.model.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaMapper qnaMapper;
	
	@Override
	public List<QnaDto> selectAllQBoard() {
		// TODO Auto-generated method stub
		return qnaMapper.selectQBoard();
	}

	@Override
	public QnaDto detailQBoard(int no) {
		// TODO Auto-generated method stub
		return qnaMapper.selectQBoardByNo(no);
	}

	@Override
	public boolean writeQBoard(QnaDto qna) {
		// TODO Auto-generated method stub
		return qnaMapper.insertQBoard(qna) == 1;
	}

	@Override
	public boolean updateQBoard(QnaDto qna) {
		// TODO Auto-generated method stub
		return qnaMapper.updateQBoard(qna) == 1;
	}

	@Override
	public boolean deleteQBoard(int no) {
		// TODO Auto-generated method stub
		return qnaMapper.deleteQBoard(no)==1;
	}

}
