package io.flutter.plugins;

/**
 * 作者:王飞
 * 邮箱:1276998208@qq.com
 * create on 2018/8/4 23:02
 */
import android.content.Context;
import android.widget.Toast;
import es.dmoral.toasty.Toasty;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ToastyPlugin */
public class ToastyPlugin implements MethodCallHandler {

    private Context context;

    public ToastyPlugin(Context context) {
        this.context = context;
    }

    /** Plugin registration. */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "toasty");
        channel.setMethodCallHandler(new ToastyPlugin((Context) registrar.context()));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        String message = call.argument("message").toString();
        if (call.method.equals("success")) {
            Toasty.success(this.context, message, Toast.LENGTH_SHORT, true).show();

        } else if (call.method.equals("info")) {
            Toasty.info(this.context, message, Toast.LENGTH_SHORT, true).show();

        } else if (call.method.equals("info")) {
            Toasty.info(this.context, message, Toast.LENGTH_SHORT, true).show();

        } else if (call.method.equals("warning")) {
            Toasty.warning(this.context, message, Toast.LENGTH_SHORT, true).show();

        } else if (call.method.equals("normal")) {
            Toasty.normal(this.context, message, Toast.LENGTH_SHORT).show();

        } else if (call.method.equals("error")) {
            Toasty.error(this.context, message, Toast.LENGTH_SHORT, true).show();

        } else {
            result.notImplemented();
        }
    }
}