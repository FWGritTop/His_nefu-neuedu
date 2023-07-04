import request from '@/utils/request'

// 查询结算类别列表
export function listSettlecategory(query) {
    return request({
        url: '/system/settlecategory/list',
        method: 'get',
        params: query
    })
}

// 查询结算类别详细
export function getSettlecategory(id) {
    return request({
        url: '/system/settlecategory/' + id,
        method: 'get'
    })
}

// 新增结算类别
export function addSettlecategory(data) {
    return request({
        url: '/system/settlecategory',
        method: 'post',
        data: data
    })
}

// 修改结算类别
export function updateSettlecategory(data) {
    return request({
        url: '/system/settlecategory',
        method: 'put',
        data: data
    })
}

// 删除结算类别
export function delSettlecategory(id) {
    return request({
        url: '/system/settlecategory/' + id,
        method: 'delete'
    })
}
