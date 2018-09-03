package cn.com.ecjtu.utils;

import redis.clients.jedis.*;

import java.util.HashSet;
import java.util.Set;

public class JedisUtils {
    //创建连接池
    private static JedisPoolConfig config;
    private static JedisPool pool;

    static{
        config=new JedisPoolConfig();
        config.setMaxTotal(30);
        config.setMaxIdle(2);

        pool=new JedisPool(config, "172.16.2.129", 6379);
        pool = new JedisPool();
    }

    //获取连接的方法
    public static Jedis getJedis(){
        return pool.getResource();
    }

    public static JedisCluster getJedisCluster(){
        Set<HostAndPort> nodes = new HashSet<HostAndPort>();
        nodes.add(new HostAndPort("172.16.2.129",7000));
        nodes.add(new HostAndPort("172.16.2.129",7001));
        nodes.add(new HostAndPort("172.16.2.129",7002));
        nodes.add(new HostAndPort("172.16.2.129",7003));
        nodes.add(new HostAndPort("172.16.2.129",7004));
        nodes.add(new HostAndPort("172.16.2.129",7005));
        JedisCluster jedisCluster = new JedisCluster(nodes);
        return jedisCluster;
    }

    //释放连接
    public static void closeJedis(Jedis jedis){
        jedis.close();
    }
}
