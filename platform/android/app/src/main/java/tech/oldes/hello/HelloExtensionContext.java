//   ____  __   __        ______        __
//  / __ \/ /__/ /__ ___ /_  __/__ ____/ /
// / /_/ / / _  / -_|_-<_ / / / -_) __/ _ \
// \____/_/\_,_/\__/___(@)_/  \__/\__/_// /
//  ~~~ oldes.huhuman at gmail.com ~~~ /_/
//
// SPDX-License-Identifier: Apache-2.0

package tech.oldes.hello;

import java.util.HashMap;
import java.util.Map;
import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;


public class HelloExtensionContext extends FREContext
{
	public HelloExtensionContext()
	{
	}

	@Override
	public void dispose() {
		if(HelloExtension.VERBOSE > 0) Log.i(HelloExtension.TAG,"Context disposed.");
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functions = new HashMap<>();
		functions.put("init", new HelloFunctions.Init());
		functions.put("nativeVersion", new HelloFunctions.NativeVersion());
		functions.put("systemLog", new HelloFunctions.SystemLog());
		
		return functions;
	}
}
