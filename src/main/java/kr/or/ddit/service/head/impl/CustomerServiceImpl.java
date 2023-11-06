package kr.or.ddit.service.head.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.VendorMapper;
import kr.or.ddit.service.head.ICustomerService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.VendorVO;

@Service
public class CustomerServiceImpl implements ICustomerService{
	
	@Inject
	private VendorMapper mapper;

	@Override
	public int selectTotalVendorCount(HeadPaginationInfoVO<VendorVO> pagingVO) {
		return mapper.selectTotalVendorCount(pagingVO);
	}

	@Override
	public List<VendorVO> selectTotalVendorList(HeadPaginationInfoVO<VendorVO> pagingVO) {
		return mapper.selectTotalVendorList(pagingVO);
	}

	@Override
	public List<VendorVO> selectCategoryList(VendorVO vendorVO) {
		return mapper.selectCategoryList(vendorVO);
	}

	@Override
	public VendorVO selectVendorName(VendorVO vendorVO) {
		return mapper.selectVendorName(vendorVO);
	}

	// 등록
	@Override
	public ServiceResult registVendor(List<VendorVO> vendorVO) {
		
		ServiceResult result = null;
		
		int status = mapper.registVendor(vendorVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 수정
	@Override
	public VendorVO selectVendor(String vdCode) {
		return mapper.selectVendor(vdCode);
	}

	@Override
	public void updateVendor(VendorVO vendorVO) {
		mapper.updateVendor(vendorVO);
	}

	@Override
	public ServiceResult deleteVendor(String vdCode) {
		ServiceResult result = null;
		mapper.deleteHeadInventory(vdCode);	// 본사재고 삭제
		mapper.deleteVendorInventory(vdCode); // 거래처재고 삭제
		int status = mapper.deleteVendor(vdCode); // 거래처 삭제
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
}
