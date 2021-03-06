package com.nantian.foo.web.util.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.Predicate;

import com.nantian.foo.web.util.ServiceException;
import com.nantian.foo.web.util.dao.ParamDao;
import com.nantian.foo.web.util.entity.Param;
import com.nantian.foo.web.util.service.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;


@Service
public class ParamServiceImpl implements ParamService {
    private final ParamDao paramDao;

    @Autowired
    public ParamServiceImpl(ParamDao paramDao) {
        this.paramDao = paramDao;
    }

    /**
     * 根据条件查询参数信息
     *
     * @param page 起始记录数
     * @param size 最大记录数
     * @return Page<Param>
     * @throws ServiceException ServiceException
     */
    public Page<Param> findParamByCondition(int page, int size, Param param) throws ServiceException {
        Pageable pageable = PageRequest.of(page, size, Sort.Direction.ASC, "paramName");
        Specification<Param> specification = (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (param.getParamName() != null && !param.getParamName().equals("")) {
                Predicate paramName = criteriaBuilder.like(root.get("paramName").as(String.class), param.getParamName() + "%");
                predicates.add(paramName);
            }

            query.where(criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()])));
            return query.getRestriction();
        };
        Page<Param> paramPage = paramDao.findAll(specification, pageable);
        return paramPage;
    }

    /**
     * 添加参数信息
     *
     * @param paramIn 参数信息
     * @return Param 参数信息
     * @throws ServiceException ServiceException
     */
    public Param addParam(Param paramIn) throws ServiceException {
        Optional<Param> optionalParam = paramDao.findById(paramIn.getParamName());
        if (optionalParam.isPresent()) {
            throw new ServiceException("系统参数信息已存在[添加失败]");
        } else {
            paramDao.save(paramIn);
            return paramIn;
        }
    }

    /**
     * 查询特定参数信息
     *
     * @param paramName 参数名称
     * @return Param
     * @throws ServiceException ServiceException
     */
    public Param findParamById(String paramName) throws ServiceException {
        Optional<Param> optionalParam = paramDao.findById(paramName);
        if (optionalParam.isPresent()) {
            return optionalParam.get();
        } else {
            throw new ServiceException("查找的系统参数不存在[查询失败]");
        }
    }

    /**
     * 更新参数信息
     *
     * @param paramIn 参数信息
     * @return Param 参数信息
     * @throws ServiceException ServiceException
     */
    public Param updateParam(Param paramIn) throws ServiceException {
        if (paramIn != null && paramIn.getParamValue() != null) {
            Optional<Param> optionalParam = paramDao.findById(paramIn.getParamName());
            if (optionalParam.isPresent()) {
                Param param = optionalParam.get();
                param.setParamValue(paramIn.getParamValue());
                param.setParamDesc(paramIn.getParamDesc());
                param.setParamRemark(paramIn.getParamRemark());
                paramDao.save(param);
                return param;
            } else {
                throw new ServiceException("系统参数信息为空[更新失败]");
            }
        }
        else
        {
            throw new ServiceException("参数名称为空[更新失败]");
        }
    }

    /**
     * 删除参数信息
     *
     * @param paramName 参数名称
     * @throws ServiceException ServiceException
     */
    public void removeParam(String paramName) throws ServiceException {

        if (paramName != null) {
            Optional<Param> optionalParam = paramDao.findById(paramName);
            if (optionalParam.isPresent()) {
                paramDao.delete(optionalParam.get());
            } else {
                throw new ServiceException("系统参数信息为空[删除失败]");
            }
        }
        else {
            throw new ServiceException("参数名称为空[删除失败]");
        }
    }

    /**
     * 删除参数信息
     *
     * @param paramNames 参数名称
     * @throws ServiceException ServiceException
     */
    public void removeParams(List<String> paramNames) throws ServiceException {

        if (paramNames.size() > 0) {
            for (String paramName : paramNames) {
                Optional<Param> optionalParam = paramDao.findById(paramName);
                if (optionalParam.isPresent()) {
                    paramDao.delete(optionalParam.get());
                } else {
                    throw new ServiceException("系统参数信息为空[删除失败]");
                }
            }
        } else {
            throw new ServiceException("参数列表为空[删除失败]");
        }
    }

}
