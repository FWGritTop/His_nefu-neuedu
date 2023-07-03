import request from '@/utils/request'

// 查询非药品收费列表
export function listFmeditem(query) {
    return request({
        url: '/system/fmeditem/list',
        method: 'get',
        params: query
    })
}

// 查询非药品收费详细
export function getFmeditem(id) {
    return request({
        url: '/system/fmeditem/' + id,
        method: 'get'
    })
}

// 新增非药品收费
export function addFmeditem(data) {
    return request({
        url: '/system/fmeditem',
        method: 'post',
        data: data
    })
}

// 修改非药品收费
export function updateFmeditem(data) {
    return request({
        url: '/system/fmeditem',
        method: 'put',
        data: data
    })
}

// 删除非药品收费
export function delFmeditem(id) {
    return request({
        url: '/system/fmeditem/' + id,
        method: 'delete'
    })
}
