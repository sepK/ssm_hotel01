package cn.com.ecjtu.utils;

import org.junit.Test;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class RedisTest {
    @Test
    public void demo(){
        /*Jedis jedis = new Jedis("172.16.2.129",7369);
        System.out.println(jedis.ping());*/
        Set<HostAndPort> nodes = new HashSet<HostAndPort>();
        nodes.add(new HostAndPort("172.16.2.129",7000));
        nodes.add(new HostAndPort("172.16.2.129",7001));
        nodes.add(new HostAndPort("172.16.2.129",7002));
        nodes.add(new HostAndPort("172.16.2.129",7003));
        nodes.add(new HostAndPort("172.16.2.129",7004));
        nodes.add(new HostAndPort("172.16.2.129",7005));


        JedisCluster jedisCluster = new JedisCluster(nodes);
        //jedisCluster.set("xx","x");
        System.out.println(jedisCluster.get("xx"));
    }
}
