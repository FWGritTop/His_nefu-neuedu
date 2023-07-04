import request from '@/utils/request'

// 查询检查检验申请列表
export function listCheckapply(query) {
    return request({
        url: '/system/checkapply/list',
        method: 'get',
        params: query
    })
}

// 查询检查检验申请详细
export function getCheckapply(id) {
    return request({
        url: '/system/checkapply/' + id,
        method: 'get'
    })
}

// 新增检查检验申请
export function addCheckapply(data) {
    return request({
        url: '/system/checkapply',
        method: 'post',
        data: data
    })
}

// 修改检查检验申请
export function updateCheckapply(data) {
    return request({
        url: '/system/checkapply',
        method: 'put',
        data: data
    })
}

// 删除检查检验申请
export function delCheckapply(id) {
    return request({
        url: '/system/checkapply/' + id,
        method: 'delete'
    })
}
