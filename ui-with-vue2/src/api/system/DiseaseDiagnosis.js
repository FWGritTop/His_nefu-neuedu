import request from '@/utils/request'

// 查询病历疾病诊断列表
export function listDiseaseDiagnosis(query) {
    return request({
        url: '/system/DiseaseDiagnosis/list',
        method: 'get',
        params: query
    })
}

// 查询病历疾病诊断详细
export function getDiseaseDiagnosis(id) {
    return request({
        url: '/system/DiseaseDiagnosis/' + id,
        method: 'get'
    })
}

// 新增病历疾病诊断
export function addDiseaseDiagnosis(data) {
    return request({
        url: '/system/DiseaseDiagnosis',
        method: 'post',
        data: data
    })
}

// 修改病历疾病诊断
export function updateDiseaseDiagnosis(data) {
    return request({
        url: '/system/DiseaseDiagnosis',
        method: 'put',
        data: data
    })
}

// 删除病历疾病诊断
export function delDiseaseDiagnosis(id) {
    return request({
        url: '/system/DiseaseDiagnosis/' + id,
        method: 'delete'
    })
}
