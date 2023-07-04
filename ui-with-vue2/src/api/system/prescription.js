import request from '@/utils/request'

// 查询成药处方列表
export function listPrescription(query) {
    return request({
        url: '/system/prescription/list',
        method: 'get',
        params: query
    })
}

// 查询成药处方详细
export function getPrescription(id) {
    return request({
        url: '/system/prescription/' + id,
        method: 'get'
    })
}

// 新增成药处方
export function addPrescription(data) {
    return request({
        url: '/system/prescription',
        method: 'post',
        data: data
    })
}

// 修改成药处方
export function updatePrescription(data) {
    return request({
        url: '/system/prescription',
        method: 'put',
        data: data
    })
}

// 删除成药处方
export function delPrescription(id) {
    return request({
        url: '/system/prescription/' + id,
        method: 'delete'
    })
}
