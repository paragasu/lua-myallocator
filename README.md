# lua-myallocator
Lua resty client for myallocator api inspired by [Enrico's Nodejs myallocator client](https://github.com/la-yumba/my-allocator)

# Installation
```
#luarocks install lua-myallocator
```

# API Methods

#### new 
- vendor_id
- vendor_password
- property_id
- property_password

#### ARIRulesList(params)
Lists all existing ARIRules.

#### ARIRulesUpdate(params)
#### ARIUpdate(params) 
#### ARIUpdateStatus(params)
#### AssociatePropertyToPMS(params)
#### AssociateUserToPMS(params)
#### BookingList(params)
#### BookingPaymentDownload(params)
#### ChannelList(params)
#### HelloUser(params)
#### HelloVendor(params)
#### HelloVendorUser(params)
#### HelloWorld(params)
#### LoopBookingCreate(params)
#### PropertyChannelList(params)
#### PropertyList(params)
#### RoomAvailabilityList(params)
#### RoomCreate(params)
#### RoomList(params)
#### RoomRemove(params)
#### RoomUpdate(params)
#### VendorSet(params)

# Reference
[MyAllocator API](http://myallocator.github.io/apidocs)
