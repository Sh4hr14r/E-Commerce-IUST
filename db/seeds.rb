#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
p0 = Product.create(:name => 'Galaxy S IV' , :manufacturer => 'Samsung', :description => "The Samsung Galaxy S4 is a smartphone manufactured by Samsung Electronics. It was announced in New York City on March 14, as the successor to the Samsung Galaxy S III. The phone has many distinguishing software features such as Air Gesture, Smart Stay, and Smart Scroll; a 13-megapixel back camera, and a 5-inch (130 mm) 1080p displayIt is the first TCO certified smartphone.The S4 has two major variants, one featuring a quad-core Qualcomm Snapdragon 600 and the other featuring a Samsung Exynos 5 Octa. The Exynos 5 Octa version features the first big.LITTLE architecture central processing unit (CPU) but does not have LTE connectivity. The CPU has eight cores, four of which can be active at one time to emulate a quad-core processor.",
                     :image_url => 's4.jpg' ,:price => 599 ,
                     :stock => 20 ,:sold => 0 ,:income => 0)

p4 = Product.create(:name => 'Lumia 920' , :manufacturer => 'Nokia', :description => "Nokia Lumia 920 is a smartphone developed by Nokia that runs the Windows Phone 8 operating system. It was announced on September 5, 2012, and was first released on November 2, 2012. It has a 1.5 GHz dual-core Qualcomm Krait CPU and a 114 mm (4.5 inches) IPS TFT LCD display, as well as a high-sensitivity capacitive touchscreen that is covered by curved Gorilla Glass. It supports inductive charging (it can be charged by being placed directly onto a charging pad) and is compatible with Qi Inductive Charging; further, it features an 8.7 megapixel PureView camera with optical image stabilization for still images and videos. It comes with 32 GB internal storage, but has no card slot; hence it cannot be expanded with memory cards. Its touchscreen also can be used with the gloves worn by the user.",
                     :image_url => 'l920.jpg' ,:price => 499 ,
                     :stock => 17 ,:sold => 0 ,:income => 0)

p5 = Product.create(:name => 'iPhone 5' , :manufacturer => 'Apple', :description => "The iPhone 5 is a touchscreen-based smartphone developed by Apple Inc.. It is the sixth generation of the iPhone and succeeds the iPhone 4S. The phone is a slimmer, lighter model that introduces a higher-resolution, 4-inch screen to the series with 16:9 widescreen aspect ratio. The phone also includes a custom-designed ARMv7 processor called the Apple A6, an update to Apple's mobile operating system known as iOS 6, and support for LTE.Apple held an event to formally introduce the phone on September 12, 2012. Apple began taking pre-orders on September 14, 2012, and over two million were received within 24 hours. Initial demand for the iPhone 5 exceeded the supply available at launch on September 21, 2012, and has been described by Apple as 'extraordinary', with pre-orders having sold twenty times faster than its predecessors. Following the launch, Samsung filed a lawsuit against Apple, claiming that the iPhone 5 infringes eight of its patents.",
                     :image_url => 'i5.png' ,:price => 599 ,
                     :stock => 18 ,:sold => 0 ,:income => 0)


p1 = Product.create(:name => 'One' , :manufacturer => 'HTC', :description => "The HTC One is an Android smartphone developed by the Taiwanese manufacturer HTC. The device serves as a successor to HTC's 2012 flagship phone, the One X—a device that was critically acclaimed, but commercially unsuccessful due in part to poor marketing efforts. The HTC One was developed with an emphasis on unique hardware and software features, such as a uni-body aluminum casing, a new image sensor implementation for its camera, front-facing stereo speakers, a revised version of HTC's Sense user experience, the 'BlinkFeed' news aggregator and 'Zoe' camera features.While initially set for a release in mid-March 2013, manufacturing delays led to a staggered release beginning in late March, with its release date in certain markets (such as Asia and North America) pushed as far back as April. Despite these issues, the One sold around 5 million units through its first two months of worldwide availability.The One was universally praised for its hardware design and well received for its software features, but certain aspects of the device's software were met with mixed reviews.",
               :image_url => 'one.jpg' ,:price => 699 ,
               :stock => 24 ,:sold => 0 ,:income => 0)

p2 = Product.create(:name => 'Galaxy Grand' , :manufacturer => 'Samsung', :description => "The Samsung Galaxy Grand is a smartphone developed by Samsung Electronics. It was announced by Samsung on December 18, 2012.[1] The Samsung Galaxy Grand has a dual core Cortex-A9 1.2 GHz processor and a RAM of 1 GB, with an internal memory of 8 GB which can be extended to another 64 GB by use of microSD cards. The device also supports internet connectivity through 2G and 3G, apart from Wi-Fi. Navigation systems including A-GPS and GLONASS with Google Maps. Galaxy Grand runs on the Android 4.1.2. Jellybean OS.",
                     :image_url => 'grand.jpg' ,:price => 449 ,
                     :stock => 74 ,:sold => 0 ,:income => 0)

p3 = Product.create(:name => 'Optimus G Pro' , :manufacturer => 'LG', :description => "The LG Optimus G Pro is a flagship smartphone designed and manufactured by LG Electronics. It was released in the US on May 10, 2013.The LG Optimus G Pro features a Qualcomm Snapdragon 600 APQ8064 SoC with a Quad-core Krait processor clocked at 1.7 GHz. The processor is based on 28 nm semiconductor technology with Adreno 320 graphics processor running at 400 Mhz.",
                     :image_url => 'gpro.jpg' ,:price => 249 ,
                     :stock => 2 ,:sold => 0 ,:income => 0)

