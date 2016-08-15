# lua-myallocator
Lua resty client for myallocator api inspired by [Enrico's Nodejs myallocator client](https://github.com/la-yumba/my-allocator)

# Installation
```
#luarocks install lua-myallocator
```

# Usage
```lua
local ma = require 'myallocator'
local auth = {
  vendor_id = 'xxx',
  vendor_password = 'xxxx',
  property_id = '739393',
  property_password = 'xxx' 
}

local myallocator = ma:new(auth)
-- get the room list
local res = myallocator:RoomList()

```

# API Methods

#### Configuration 

new(auth_config) 
- vendor_id
- vendor_password
- property_id
- property_password


#### Supported Methods
- ARIRulesList(params)
- ARIRulesUpdate(params)
- ARIUpdate(params) 
- ARIUpdateStatus(params)
- AssociatePropertyToPMS(params)
- AssociateUserToPMS(params)
- BookingList(params)
- BookingPaymentDownload(params)
- ChannelList(params)
- HelloUser(params)
- HelloVendor(params)
- HelloVendorUser(params)
- HelloWorld(params)
- LoopBookingCreate(params)
- PropertyChannelList(params)
- PropertyList(params)
- RoomAvailabilityList(params)
- RoomCreate(params)
- RoomList(params)
- RoomRemove(params)
- RoomUpdate(params)
- VendorSet(params)

# Reference
[MyAllocator API](http://myallocator.github.io/apidocs)
