package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.VendorVO;

public interface ICustomerService {

	public int selectTotalVendorCount(HeadPaginationInfoVO<VendorVO> pagingVO);

	public List<VendorVO> selectTotalVendorList(HeadPaginationInfoVO<VendorVO> pagingVO);

	public List<VendorVO> selectCategoryList(VendorVO vendorVO);

	public VendorVO selectVendorName(VendorVO vendorVO);

	// 등록
	public ServiceResult registVendor(List<VendorVO> vendorVO);

	// 수정
	public VendorVO selectVendor(String vdCode);
	public void updateVendor(VendorVO vendorVO);

	public ServiceResult deleteVendor(String vdCode);
	

	
}
