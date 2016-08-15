-- myallocator api client based on http://myallocator.github.io/apidocs
-- Website: github.com/paragasu/lua-myallocator
-- Author: Jeffry L. <paragasu@gmail.com>

local request = require 'requests'
local json = json or require 'cjson'
local myallocator_api_url = 'https://api.myallocator.com/pms/v201408/json/'
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

-- create api function call
local post_request  = function(req)
  for k, v in pairs(auth) do req[k] = v end -- merge with auth
  local res = request.post(myallocator_api_url .. method, {
    data    = json.encode(req),
    headers = { ['Content-Type'] = 'application/json' }
  }) 
  return res.json()
end


-- config table
function _M.new(self, auth)
  auth = {
    ['Auth/VendorId'] = auth.vendor_id,
    ['Auth/VendorPassword'] = auth.vendor_password,
    ['Auth/PropertyId'] = auth.property_id,
    ['Auth/UserPassword'] = auth.property_password
  }

  for method in api_method do 
    _M[method] = post_request 
  end
  return setmetatable(_M, mt) 
end

return _M
