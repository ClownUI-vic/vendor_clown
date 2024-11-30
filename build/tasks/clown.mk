# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# ClownUI OTA update package

LINEAGE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(LINEAGE_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

$(LINEAGE_TARGET_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv -f $(INTERNAL_OTA_PACKAGE_TARGET) $(LINEAGE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(LINEAGE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(LINEAGE_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/lineage/build/tools/createjson.sh $(TARGET_DEVICE) $(PRODUCT_OUT) $(LINEAGE_VERSION).zip
	$(hide) rm -rf $(call intermediates-dir-for,PACKAGING,target_files)
	@echo "Done"
	@echo -e "\t ==================-Package complete-======================"
	@echo -e "\t ███████████████████████████████████████████████ "
	@echo -e "\t █─▄▄▄─█▄─▄███─▄▄─█▄─█▀▀▀█─▄█▄─▀█▄─▄█▄─██─▄█▄─▄█ "
	@echo -e "\t █─███▀██─██▀█─██─██─█─█─█─███─█▄▀─███─██─███─██ "
	@echo -e "\t ▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▄▄▄▀▄▄▄▀▀▄▄▄▀▀▄▄▀▀▄▄▄▄▀▀▄▄▄▀ "
	@echo -e "\t =========================================================="
	@echo -e "\t Zip: $(LINEAGE_TARGET_PACKAGE)"
	@echo -e "\t SHA256: `cat $(LINEAGE_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"
	@echo -e "\t Size: `du -sh $(LINEAGE_TARGET_PACKAGE) | awk '{print $$1}' `"
	@echo -e "\t =========================================================="
	
.PHONY: clown
clown: $(LINEAGE_TARGET_PACKAGE) $(DEFAULT_GOAL)