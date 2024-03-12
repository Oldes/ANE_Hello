//   ____  __   __        ______        __
//  / __ \/ /__/ /__ ___ /_  __/__ ____/ /
// / /_/ / / _  / -_|_-<_ / / / -_) __/ _ \
// \____/_/\_,_/\__/___(@)_/  \__/\__/_// /
//  ~~~ oldes.huhuman at gmail.com ~~~ /_/
//
// SPDX-License-Identifier: Apache-2.0

package tech.oldes.hello;

import android.content.Context;
import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class HelloExtension implements FREExtension
{
	public static final String TAG = "ANE_Hello";
	public static final String VERSION = "1.0.1";
	public static final int VERBOSE = 0;

	public static HelloExtensionContext extensionContext;
	public static Context appContext;

	@Override
	public FREContext createContext(String contextType) {
		return extensionContext = new HelloExtensionContext();
	}

	@Override
	public void dispose() {
		if(VERBOSE > 0) Log.i(TAG, "Extension disposed.");
		appContext = null;
		extensionContext = null;
	}

	@Override
	public void initialize() {
		if(VERBOSE > 0) Log.i(TAG, "Extension initialized.");
	}
}
