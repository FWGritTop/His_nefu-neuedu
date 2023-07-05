import request from '@/utils/request'

// 查询病历信息列表
export function listMedicalrecord(query) {
    return request({
        url: '/system/medicalrecord/list',
        method: 'get',
        params: query
    })
}

// 查询病历信息详细
export function getMedicalrecord(id) {
    return request({
        url: '/system/medicalrecord/' + id,
        method: 'get'
    })
}

// 新增病历信息
export function addMedicalrecord(data) {
    return request({
        url: '/system/medicalrecord',
        method: 'post',
        data: data
    })
}

// 修改病历信息
export function updateMedicalrecord(data) {
    return request({
        url: '/system/medicalrecord',
        method: 'put',
        data: data
    })
}

// 删除病历信息
export function delMedicalrecord(id) {
    return request({
        url: '/system/medicalrecord/' + id,
        method: 'delete'
    })
}
