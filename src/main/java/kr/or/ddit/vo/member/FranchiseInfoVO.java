package kr.or.ddit.vo.member;

import java.util.List;

import lombok.Data;

@Data
public class FranchiseInfoVO<T> {
	private List<T> dataList; //결과를 넣을 데이터 리스트
	private String searchWord; //검색단어(키워드)
}
