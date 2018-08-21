package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.mapper.AdminMapper;
import cn.com.ecjtu.pojo.Admin;
import cn.com.ecjtu.pojo.AdminExample;
import cn.com.ecjtu.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{
    @Resource
    private AdminMapper adminMapper;

    public boolean checkInfo(Admin admin) {
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andAdminnameEqualTo(admin.getAdminname());
        criteria.andPasswordEqualTo(admin.getPassword());
        List<Admin> admins = adminMapper.selectByExample(example);
        return admins.size() != 0;
    }
}
