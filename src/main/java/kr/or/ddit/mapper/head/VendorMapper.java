package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.VendorVO;

public interface VendorMapper {

	public int selectTotalVendorCount(HeadPaginationInfoVO<VendorVO> pagingVO);

	public List<VendorVO> selectTotalVendorList(HeadPaginationInfoVO<VendorVO> pagingVO);

	public List<VendorVO> selectCategoryList(VendorVO vendorVO);

	public VendorVO selectVendorName(VendorVO vendorVO);

	public int registVendor(List<VendorVO> vendorVO);

	// 수정을 위한 거래처 select
	public VendorVO selectVendor(String vdCode);
	public void updateVendor(VendorVO vendorVO);

	// 삭제
	public int deleteVendor(String vdCode);
	public void deleteHeadInventory(String vdCode); // 본사재고 삭제
	public void deleteVendorInventory(String vdCode); // 거래처재고 삭제
	
}
