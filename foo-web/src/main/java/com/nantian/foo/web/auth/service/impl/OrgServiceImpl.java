package com.nantian.foo.web.auth.service.impl;

import com.nantian.foo.web.auth.dao.OrgDao;
import com.nantian.foo.web.auth.entity.OrgInfo;
import com.nantian.foo.web.auth.service.OrgService;
import com.nantian.foo.web.auth.vo.OrgTreeNode;
import com.nantian.foo.web.util.DataUtil;
import com.nantian.foo.web.util.DateUtil;
import com.nantian.foo.web.util.ServiceException;
import com.nantian.foo.web.util.vo.GridData;
import com.nantian.foo.web.util.vo.LoginBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Predicate;
import java.util.*;

/**
 * 机构管理业务逻辑处理
 */
@Service
public class OrgServiceImpl implements OrgService {
    private static Logger log = LoggerFactory.getLogger(OrgServiceImpl.class.getName());

    private OrgDao orgDao;

    @Autowired
    public OrgServiceImpl(OrgDao orgDao) {
        this.orgDao = orgDao;
    }

    /**
     * 预录入机构信息
     */
    public OrgTreeNode addOrgInfo(OrgTreeNode orgTreeNode, LoginBean loginBean) throws ServiceException {
        Optional<OrgInfo> optionalParentOrg = orgDao.findById(Long.parseLong(orgTreeNode.getParentId()));
        if (optionalParentOrg.isPresent()) {
            OrgInfo parentOrgInfo = optionalParentOrg.get();
            String orgName = orgTreeNode.getText();
            if (orgName != null && orgName.trim().length() > 0) {
                orgName = orgName.trim();
                List<OrgInfo> orgInfos = orgDao.findByOrgName(orgTreeNode.getText());
                if (orgInfos.size() == 0) {
                    OrgInfo orgInfo = new OrgInfo();
                    orgInfo.setParentId(Long.parseLong(orgTreeNode.getParentId()));
                    orgInfo.setOrgName(orgName);
                    String orgCode = orgTreeNode.getOrgCode();
                    if (orgCode != null && orgCode.trim().length() > 0) {
                        List<OrgInfo> orgInfosByOrgCode = orgDao.findByOrgCode(orgCode);

                        if (orgInfosByOrgCode.size() == 0) {
                            orgInfo.setOrgCode(orgTreeNode.getOrgCode());
                            orgInfo.setOrgAddr(orgTreeNode.getOrgAddr());
                            orgInfo.setOrgManager(orgTreeNode.getOrgManager());
                            orgInfo.setOrgTelephone(orgTreeNode.getOrgTelephone());
                            orgInfo.setAreaCode(orgTreeNode.getAreaCode());
                            orgInfo.setEditor(loginBean.getUserName());
                            orgInfo.setLastEditTime(DateUtil.getCurrentTime("yyyy-MM-dd HH:mm:ss"));

                            OrgInfo savedOrgInfo = orgDao.saveAndFlush(orgInfo);
                            String orgIdStr = DataUtil.addZeroForNum(savedOrgInfo.getOrgId() + "", 5);
                            String orgPath = parentOrgInfo.getOrgPath() + orgIdStr;
                            savedOrgInfo.setOrgPath(orgPath);
                            orgDao.saveAndFlush(savedOrgInfo);
                            return new OrgTreeNode(orgInfo, true);
                        } else {
                            orgName = orgInfosByOrgCode.get(0).getOrgName();
                            throw new ServiceException("机构号[" + orgCode + "]已经被机构[" + orgName + "]关联");
                        }
                    } else {
                        throw new ServiceException("机构号必填！");
                    }
                } else {
                    throw new ServiceException("机构[" + orgName + "]已经存在！");
                }
            } else {
                throw new ServiceException("机构名称必填！");
            }
        } else {
            throw new ServiceException("上级机构已删除！");
        }
    }

    /**
     * 删除机构信息
     */
    public void removeOrgInfo(OrgTreeNode orgTreeNode, LoginBean loginBean) throws ServiceException {
        List<Long> orgIds = orgTreeNode.getOrgIds();
        List<String> orgCodes = new ArrayList<>();
        if (orgIds != null && orgIds.size() > 0) {
            for (Long orgId : orgIds) {
                checkCanRemove(orgId);


                Optional<OrgInfo> optional = orgDao.findById(orgId);
                if (optional.isPresent()) {
                    OrgInfo orgInfo = optional.get();
                    String orgName = orgInfo.getOrgName();
                    try {
                        orgDao.delete(orgInfo);
                        orgCodes.add(orgInfo.getOrgCode());
                    } catch (Exception e) {
                        throw new ServiceException("机构：[" + orgName + "] 尚有记录关联,请先删除关联关系!");
                    }
                }
            }
            orgTreeNode.setOrgCodes(orgCodes);
        }

    }

    /**
     * 判断是否能删除机构
     *
     * @param orgId Long
     * @throws ServiceException ServiceException
     */
    private void checkCanRemove(Long orgId) throws ServiceException {

        Optional<OrgInfo> optional = orgDao.findById(orgId);
        if (optional.isPresent()) {
            List<OrgInfo> orgInfos = orgDao.findByParentId(orgId);
            if (orgInfos.size() != 0) {
                throw new ServiceException("有子机构,请先删除子机构");
            }
        }

    }

    @Override
    public void checkIsRemoveOrg(Long orgId) throws ServiceException {
        checkCanRemove(orgId);
    }

    /**
     * 获取机构信息
     */
    public OrgTreeNode queryOrgInfoById(Long orgId) throws ServiceException {
        Optional<OrgInfo> optional = orgDao.findById(orgId);
        if (optional.isPresent()) {
            OrgInfo orgInfo = optional.get();
            OrgTreeNode orgTreeNodeRet = new OrgTreeNode(orgInfo, true);
            if (orgInfo.getParentId() != null) {
                Optional<OrgInfo> optionalTmp = orgDao.findById(orgInfo.getParentId());
                if (optionalTmp.isPresent()) {
                    OrgInfo orgInfoTmp = optionalTmp.get();
                    orgTreeNodeRet.setParentOrgName(orgInfoTmp.getOrgName());
                    orgTreeNodeRet.setParentOrgCode(orgInfoTmp.getOrgCode());
                }

            }
            return orgTreeNodeRet;
        } else {
            throw new ServiceException("机构已被其他用户删除");
        }
    }

    /**
     * 更新机构信息
     */
    public OrgTreeNode updateOrgInfo(OrgTreeNode orgTreeNode, LoginBean loginBean) throws ServiceException {
        Optional<OrgInfo> optional = orgDao.findById(Long.parseLong(orgTreeNode.getId()));

        if (!optional.isPresent()) {
            throw new ServiceException("不存在编辑的本机机构信息！");
        } else {
            OrgInfo orgInfo = optional.get();
            List<OrgInfo> orgInfosByOrgCode = orgDao.findByOrgCode(orgTreeNode.getParentOrgCode());
            if (orgInfosByOrgCode.size() > 0) {
                Long parentOrgId = orgInfosByOrgCode.get(0).getOrgId();
                if (parentOrgId != null && !("" + parentOrgId).equals(orgTreeNode.getParentId()) && !("" + orgTreeNode.getId()).equals("1") && !("" + parentOrgId).equals(orgTreeNode.getId())) {
                    Optional<OrgInfo> optionalTmp = orgDao.findById(parentOrgId);
                    if (optionalTmp.isPresent()) {
                        OrgInfo orgInfoTemp = optionalTmp.get();
                        String orgPath = orgInfoTemp.getOrgPath();
                        List<OrgInfo> orgInfos = orgDao.findByParentId(Long.parseLong(orgTreeNode.getId()));
                        if (orgInfos.size() != 0) {
                            orgInfo.setParentId(parentOrgId);
                            orgInfo.setOrgPath(orgPath + orgTreeNode.getId());
                            getOrgChild(orgTreeNode.getId(), orgInfos, orgInfo.getOrgId(), orgPath);
                        } else {
                            orgInfo.setParentId(parentOrgId);
                            orgInfo.setOrgPath(orgPath + orgTreeNode.getId());
                        }
                    }
                }
            }

            String orgName = orgTreeNode.getText();
            if (orgName != null && orgName.trim().length() > 0) {
                boolean orgNameUpdateFlag = false;
                if (!orgInfo.getOrgName().equalsIgnoreCase(orgName)) {
                    orgNameUpdateFlag = true;
                    Optional<OrgInfo> optionalTmp = orgDao.findById(Long.parseLong(orgTreeNode.getId()));
                    if (optionalTmp.isPresent()) {
                        String oldorgname = optionalTmp.get().getOrgName();
                        List<OrgInfo> orgInfos = orgDao.findByOrgName(orgName);
                        if (orgInfos.size() > 0 && !oldorgname.equals(orgName)) {
                            throw new ServiceException("机构[" + orgName + "]已经存在！");
                        }
                    }
                }
                String orgCode = orgTreeNode.getOrgCode();
                if (orgCode != null && orgCode.trim().length() > 0) {
                    String oldOrgCode = orgInfo.getOrgCode();
                    if (!orgCode.equalsIgnoreCase(oldOrgCode)) {
                        List<OrgInfo> orgByOrgCode = orgDao.findByOrgCode(orgCode);
                        Long orgIdByorgCode = orgByOrgCode.get(0).getOrgId();
                        if (orgIdByorgCode != null) {
                            Optional<OrgInfo> optionalTmp = orgDao.findById(orgIdByorgCode);
                            if (optionalTmp.isPresent()) {
                                orgName = optionalTmp.get().getOrgName();
                                throw new ServiceException("机构号[" + orgCode + "]已经被机构[" + orgName + "]关联");
                            }
                        }
                    }
                    orgInfo.setOrgName(orgName);
                    orgInfo.setAreaCode(orgTreeNode.getAreaCode());
                    orgInfo.setOrgCode(orgTreeNode.getOrgCode());
                    orgInfo.setOrgAddr(orgTreeNode.getOrgAddr());
                    orgInfo.setOrgManager(orgTreeNode.getOrgManager());
                    orgInfo.setOrgTelephone(orgTreeNode.getOrgTelephone());
                    orgInfo.setEditor(loginBean.getUserName());
                    orgInfo.setLastEditTime(DateUtil.getCurrentTime("yyyy-MM-dd HH:mm:ss"));
                    orgDao.saveAndFlush(orgInfo);
                    OrgTreeNode orgTreeNodeRet = new OrgTreeNode(orgInfo, true);
                    orgTreeNodeRet.setOldOrgCode(oldOrgCode);
                    return orgTreeNodeRet;
                } else {
                    throw new ServiceException("机构号必填！");
                }
            } else {
                throw new ServiceException("机构名称必填！");
            }
        }
    }

    public void getOrgChild(String orgId, List<OrgInfo> orgInfos, Long parentOrgId, String orgPath) {
        for (OrgInfo orginfo : orgInfos) {
            orginfo.setOrgPath(orgPath + orginfo.getOrgId());
            orginfo.setParentId(parentOrgId);
            orgDao.saveAndFlush(orginfo);
            OrgTreeNode orgTreeNodeRet = new OrgTreeNode(orginfo, true);
            List<OrgInfo> neworgInfos = orgDao.findByParentId(orginfo.getOrgId());
            if (neworgInfos.size() > 0) {
                getOrgChildofChild(neworgInfos, orginfo.getOrgPath());
            }
        }
    }

    public void getOrgChildofChild(List<OrgInfo> neworgInfos, String orgPath) {
        for (OrgInfo neworginfo : neworgInfos) {
            neworginfo.setOrgPath(orgPath + neworginfo.getOrgId());
            orgDao.saveAndFlush(neworginfo);
            OrgTreeNode orgTreeNodeRet = new OrgTreeNode(neworginfo, true);
            List<OrgInfo> orgInfos = orgDao.findByParentId(neworginfo.getOrgId());
            if (neworgInfos.size() > 0) {
                getOrgChildofChild(orgInfos, neworginfo.getOrgPath());
            }
        }
    }

    public OrgTreeNode getRootOrgTree() {
        OrgInfo orgTreeNode = orgDao.getOrgRoot();
        OrgTreeNode orgTreeNodeRet = new OrgTreeNode(orgTreeNode, true);
        getChildrenOrgTree(orgTreeNodeRet, orgDao.findByParentId(orgTreeNode.getOrgId()));
        return orgTreeNodeRet;
    }

    public OrgTreeNode getApproveOrgTree(Long orgId) {
        Optional<OrgInfo> optional = orgDao.findById(orgId);
        if(optional.isPresent()){
            OrgInfo orgTreeNode = optional.get();
            OrgTreeNode orgTreeNodeRet = new OrgTreeNode(orgTreeNode, true);
            getChildrenOrgTree(orgTreeNodeRet, orgDao.findByParentId(orgId));
            return orgTreeNodeRet;
        }
        else {
            return null;
        }
    }

    private void getChildrenOrgTree(OrgTreeNode orgTreeNode, List<OrgInfo> orgInfos) {
        if (orgInfos.size() > 0) {
            OrgTreeNode childOrgTreeNode = null;
            for (OrgInfo orgInfo : orgInfos) {
                Long orgId = orgInfo.getOrgId();

                childOrgTreeNode = new OrgTreeNode(orgInfo, true);
                orgTreeNode.addChildNode(childOrgTreeNode);

                getChildrenOrgTree(childOrgTreeNode, orgDao.findByParentId(orgId));

            }
        } else {
            orgTreeNode.setLeaf(true);
        }
    }

    public GridData<OrgTreeNode> findByCondition(int page, int size, Long orgId) throws ServiceException {
        Pageable pageable = PageRequest.of(page, size);
        Specification<OrgInfo> specification = (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (orgId != null) {
                Predicate orgIdp = criteriaBuilder.equal(root.get("orgId").as(Long.class), orgId);
                predicates.add(orgIdp);
            }
            query.where(criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()])));
            return query.getRestriction();
        };
        Page<OrgInfo> orgInfoPage = orgDao.findAll(specification, pageable);
        List<OrgInfo> orgInfos = orgInfoPage.getContent();
        List<OrgTreeNode> orgTreeNodes = new ArrayList<>();
        OrgTreeNode orgTreeNode = null;
        for (OrgInfo orgInfo : orgInfos) {
            orgTreeNode = new OrgTreeNode(orgInfo, true);
            Optional<OrgInfo> optional = orgDao.findById(orgInfo.getParentId());
            if(optional.isPresent()){
                orgTreeNode.setParentOrgName(optional.get()
                        .getOrgName());
                orgTreeNodes.add(orgTreeNode);
            }

        }
        GridData<OrgTreeNode> gridData = new GridData<>();
        gridData.setData(orgTreeNodes);
        gridData.setNumber(orgInfoPage.getTotalElements());
        gridData.setPage(orgInfoPage.getNumber());
        gridData.setTotalPage(orgInfoPage.getTotalPages());
        return gridData;
    }


    public List<OrgInfo> queryApproveOrgInfoChildren(Long orgId) throws ServiceException {
        List orgInfoList = null;
        if ((orgId + "").length() == 2) {
            orgInfoList = orgDao.findByParentId(orgId);
        } else {
            throw new ServiceException("notPermissions");
        }
        return orgInfoList;
    }

    public HashMap<String, OrgInfo> queryApprovedOrgInfos()
            throws ServiceException {
        List<OrgInfo> orgInfoList = null;
        Map<String, OrgInfo> orgInfoMap = new HashMap<>();
        orgInfoList = orgDao.findAll();
        for (OrgInfo orgInfo : orgInfoList) {
            if (orgInfo != null && orgInfo.getOrgCode() != null && !orgInfo.getOrgCode().equals("")) {
                orgInfoMap.put(orgInfo.getOrgCode(), orgInfo);
            }
        }
        return (HashMap<String, OrgInfo>) orgInfoMap;
    }

    public OrgInfo addOrgInfo(OrgInfo orgInfo) throws ServiceException {
        Optional<OrgInfo> optional = orgDao.findById(orgInfo.getParentId());
        if (optional.isPresent()) {
            OrgInfo orgInfoTemp = optional.get();
            orgInfo.setParentId(orgInfoTemp.getOrgId());
            String orgCode = orgInfo.getOrgCode();
            if (orgCode != null && orgCode.trim().length() > 0) {
                OrgInfo savedOrgInfo = orgDao.saveAndFlush(orgInfo);
                String orgIdStr = DataUtil.addZeroForNum(savedOrgInfo.getOrgId() + "", 5);
                //String orgIdStr = String.format("%05",savedOrgInfo.getOrgId());
                String orgPath = orgInfoTemp.getOrgPath() + orgIdStr;
                savedOrgInfo.setOrgPath(orgPath);
                orgDao.saveAndFlush(savedOrgInfo);
            }
        }
        return orgInfo;
    }

    /**
     * 更新机构信息
     */
    public OrgInfo updateOrgInfo(OrgInfo orgInfoIn) throws ServiceException {
        Optional<OrgInfo> optional = orgDao.findById(orgInfoIn.getParentId());
        if (optional.isPresent()) {
            OrgInfo orgInfo = optional.get();
            String orgName = orgInfoIn.getOrgName();
            orgInfo.setOrgName(orgInfoIn.getOrgName());
            orgInfo.setOrgAddr(orgInfoIn.getOrgAddr());
            orgInfo.setOrgManager(orgInfoIn.getOrgManager());
            orgInfo.setOrgTelephone(orgInfoIn.getOrgTelephone());
            orgDao.saveAndFlush(orgInfo);
            return orgInfo;
        } else {
            throw new ServiceException("机构不存在");
        }
    }


    public List<OrgTreeNode> queryOrgInfoByParentId(String parentId, Long userOrgId) throws ServiceException {
        List<OrgInfo> orgInfos = new ArrayList<>();
        if (parentId == null || parentId.equals("")) {
            Optional<OrgInfo> optional = orgDao.findById(userOrgId);
            if (optional.isPresent()) {
                orgInfos.add(optional.get());
            }

        } else {

            orgInfos = orgDao.findByParentId(Long.parseLong(parentId));
        }
        List<OrgTreeNode> orgTreeNodes = new ArrayList<>();
        if (orgInfos != null) {
            for (OrgInfo orgInfo : orgInfos) {
                OrgTreeNode orgTreeNode = new OrgTreeNode(orgInfo, true);
                List<OrgInfo> orgInfosTemp = orgDao.findByParentId(Long.parseLong(orgTreeNode.getId()));
                if (orgInfosTemp.size() > 0) {
                    orgTreeNode.setLeaf(false);
                } else {
                    orgTreeNode.setLeaf(true);
                }

                orgTreeNodes.add(orgTreeNode);
            }
        }
        return orgTreeNodes;
    }

}




