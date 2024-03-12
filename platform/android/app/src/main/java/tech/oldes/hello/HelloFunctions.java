//   ____  __   __        ______        __
//  / __ \/ /__/ /__ ___ /_  __/__ ____/ /
// / /_/ / / _  / -_|_-<_ / / / -_) __/ _ \
// \____/_/\_,_/\__/___(@)_/  \__/\__/_// /
//  ~~~ oldes.huhuman at gmail.com ~~~ /_/
//
// SPDX-License-Identifier: Apache-2.0

package tech.oldes.hello;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import android.util.Log;

public class HelloFunctions
{
	static public class Init implements FREFunction {
		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			HelloExtension.appContext = context.getActivity().getApplicationContext();
			return null;
		}
	}

	static public class NativeVersion implements FREFunction {
		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			FREObject result = null;
			try {
				result = FREObject.newObject( HelloExtension.VERSION );
			} catch (Exception e) {
				//FREUtils.handleException( context, e );
			}
			return result;
		}
	}

	static public class SystemLog implements FREFunction {
		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			try {
				String message = arg1[0].getAsString();
				Log.d(HelloExtension.TAG, message);
			} catch (Exception e) {
				//FREUtils.handleException( context, e );
			}
			return null;
		}
	}
}
