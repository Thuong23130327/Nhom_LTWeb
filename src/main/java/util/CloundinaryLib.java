package util;

import com.cloudinary.Cloudinary;

import java.util.HashMap;
import java.util.Map;

public class CloundinaryLib {
    public static Cloudinary getCloudinary() {
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "dyqqjmuei");
        config.put("api_key", "416967637138313");
        config.put("api_secret", "JdFwnNrNtqIJLoFXo3Usxc2EQIE");
        return new Cloudinary(config);
    }
}