import request from '@/utils/request'

// 查询患者费用明细列表
export function listPatientcosts(query) {
    return request({
        url: '/system/patientcosts/list',
        method: 'get',
        params: query
    })
}

// 查询患者费用明细详细
export function getPatientcosts(id) {
    return request({
        url: '/system/patientcosts/' + id,
        method: 'get'
    })
}

// 新增患者费用明细
export function addPatientcosts(data) {
    return request({
        url: '/system/patientcosts',
        method: 'post',
        data: data
    })
}

// 修改患者费用明细
export function updatePatientcosts(data) {
    return request({
        url: '/system/patientcosts',
        method: 'put',
        data: data
    })
}

// 删除患者费用明细
export function delPatientcosts(id) {
    return request({
        url: '/system/patientcosts/' + id,
        method: 'delete'
    })
}
