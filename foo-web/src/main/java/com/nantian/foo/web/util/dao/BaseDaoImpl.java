package com.nantian.foo.web.util.dao;

import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import javax.persistence.EntityManager;
import java.io.Serializable;
import java.util.List;

public class BaseDaoImpl<T,ID extends Serializable> extends SimpleJpaRepository<T,ID>
        implements BaseDao<T,ID> {
    private final EntityManager entityManager;

    public BaseDaoImpl(Class<T> domainClass, EntityManager em) {
        super(domainClass, em);
        this.entityManager = em;
    }

    public List listBySQL(String sql) {
        return entityManager.createNativeQuery(sql).getResultList();
    }
}
