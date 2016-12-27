-- myallocator api client based on http://myallocator.github.io/apidocs
-- Website: github.com/paragasu/lua-myallocator
-- Author: Jeffry L. <paragasu@gmail.com>

local request = require 'requests'
local json = json or require 'cjson'
local myallocator_api_url = 'https://api.myallocator.com/pms/v201408/json/'
local inspect = require 'inspect'
local auth

local _M = { __VERSION = '0.01' }
local mt = { __index = _M }

-- list of supported api
local api_method = {
  'IRulesList',
  'ARIRulesUpdate',
  'ARIUpdate',
  'ARIUpdateStatus',
  'AssociatePropertyToPMS',
  'AssociateUserToPMS',
  'BookingList',
  'BookingPaymentDownload',
  'ChannelList',
  'HelloUser',
  'HelloVendor',
  'HelloVendorUser',
  'HelloWorld',
  'LoopBookingCreate',
  'PropertyChannelList',
  'PropertyList',
  'RoomAvailabilityList',
  'RoomCreate',
  'RoomList',
  'RoomRemove',
  'RoomUpdate',
  'VendorSet'
}

-- config table
function _M.new(self, args)
  auth = {
    ['Auth/VendorId'] = args.vendor_id,
    ['Auth/VendorPassword'] = args.vendor_password,
    ['Auth/UserToken'] = args.user_token,
    ['Auth/PropertyId'] = args.property_id,
    ['Auth/UserId'] = args.user_id, --optional (not an email address)
    ['Auth/UserPassword'] = args.user_password, --optional
    ['Auth/PMSUserId'] = args.pms_user_id --optional
  }
  for k, method in pairs(api_method) do 
    _M[method] = _M.post_request 
  end
  return setmetatable(_M, mt) 
end

-- create api function call
-- request params as documented in http://myallocator.github.io/apidocs
function _M.post_request(self, req)
  req = req or {} 
  -- merge with auth & only include key with valid value
  for k, v in pairs(auth) do 
    if v then req[k] = v end 
  end
  local method = debug.getinfo(1, "n").name;
  local headers = { ['Content-Type'] = 'application/json' }
  local res = request.post(myallocator_api_url .. method, { data = req, headers = headers })
  return res.json()
end

return _M
