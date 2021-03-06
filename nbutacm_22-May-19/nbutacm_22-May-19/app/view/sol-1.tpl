{% extends "base.tpl" %} {% block main %}
<div class="container" style="margin-top: 120px; width: auto; ">
    <div class="row">
        <div class="span3" style="position:fixed;top:200px;left:100px;border: 1px solid #eeeeee; border-radius: 8px; box-shadow: 0 0 5px #eee">
            <ul>
                <li><a href="#toc_1" class="nav-link js-scroll-trigger">A.小说知识科普</a></li>
                <li><a href="#toc_5" class="nav-link js-scroll-trigger">B.论WC串的唯一性</a></li>
                <li><a href="#toc_9" class="nav-link js-scroll-trigger">C.烤烤你1</a></li>
                <li><a href="#toc_12" class="nav-link js-scroll-trigger">D.烤烤你2</a></li>
            </ul>
        </div>
        <div class="span9  markdown-body">
            <h1 id="toc_0">GoodBye8102</h1>

            <p><a href="https://github.com/yywwann/ACM-git/tree/master/Good%20Bye%208102">代码链接</a></p>

            <h2 id="toc_1">A.小说知识科普</h2>

            <h3 id="toc_2">题意</h3>

            <p>输入小说名，输出小说男猪脚</p>

            <h3 id="toc_3">题解</h3>

            <p>各种方式过题<br/>
                string的话直接==<br/>
                char[]的话strcmp<br/>
                还可以map<br/>
                因为数组已经给我们了，最快的方法就是直接用数组</p>

            <h3 id="toc_4">核心代码</h3>

            <pre><code class="language-c">#include&lt;iostream&gt;
#include&lt;cstring&gt;
using namespace std;

char s1[20][20]={&quot;将夜&quot;,&quot;仙逆&quot;,&quot;斗破苍穹&quot;,&quot;诛仙&quot;,&quot;遮天&quot;,&quot;莽荒纪&quot;,&quot;凡人修仙传&quot;,&quot;斗罗大陆&quot;,&quot;神墓&quot;,&quot;一念永恒&quot;,&quot;星辰变&quot;,&quot;庆余年&quot;,&quot;永夜君王&quot;,&quot;牧神记&quot;,&quot;盘龙&quot;};
char s2[20][20]={&quot;宁缺&quot;,&quot;王林&quot;,&quot;萧炎&quot;,&quot;张小凡&quot;,&quot;叶凡&quot;,&quot;纪宁&quot;,&quot;韩立&quot;,&quot;唐三&quot;,&quot;辰南&quot;,&quot;白小纯&quot;,&quot;秦羽&quot;,&quot;范闲&quot;,&quot;千夜&quot;,&quot;秦牧&quot;,&quot;林雷&quot;};


int main(){
    char s[15];
    int n;
    cin&gt;&gt;n;
    while(n--){
        cin&gt;&gt;s;
        for(int i=0;i&lt;15;i++){
            if(strcmp(s,s1[i])==0){
                printf(&quot;%s\n&quot;,s2[i]);
                break;
            }
        }
    }
    return 0;
}
</code></pre>

            <h2 id="toc_5">B.论WC串的唯一性</h2>

            <h3 id="toc_6">题意</h3>

            <p>给你一个字符串，问其中有多少个子序列只包含一个wc</p>

            <h3 id="toc_7">题解</h3>

            <p>子序列是连续的，子串是可以不连续的<br/>
                就是找每个wc，然后记录他的前缀（和前一个wc之间有多少个字符）和后缀（和后一个wc之间有多少个字符）<br/>
                注意前一个wc的c和后一个wc的w都是可以利用的<br/>
                比如 awcawc<br/>
                我们可以得到<br/>
                前缀 2(aw) 3(caw)<br/>
                后缀 3(caw) 1(c)<br/>
                那么答案就是 \(2*3+3*1 = 18\)</p>

            <h3 id="toc_8">核心代码</h3>

            <pre><code class="language-c">        cin &gt;&gt; s;
        len = s.size();
        int count = 0;
        for(int i=0;i&lt;len-1;i++){
            count++;
            if(s[i]==&#39;w&#39;&amp;&amp;s[i+1]==&#39;c&#39;){
                l[i] = count;
                count = 0;
            }
        }
        count = 0;
        for(int i=len-1;i&gt;=1;i--){
            count++;
            if(s[i-1]==&#39;w&#39;&amp;&amp;s[i]==&#39;c&#39;){
                r[i] = count;
                count = 0;
            }
        }
        long long ans = 0;
        for(int i=0;i&lt;len-1;i++){
            if(s[i]==&#39;w&#39;&amp;&amp;s[i+1]==&#39;c&#39;){
                ans += l[i]*r[i+1];
            }
        }
        cout &lt;&lt; ans &lt;&lt; endl;
</code></pre>

            <h2 id="toc_9">C.烤烤你1</h2>

            <h3 id="toc_10">题意</h3>

            <p>\(F（n）\)为斐波那契数列的第n项<br/>
                让你求\(F（n）*（F（n+2）+ F（n））- F（n+1）*（F（n+1）+ F（n-1））\)</p>

            <h3 id="toc_11">题解</h3>

            <p>可以打表找规律<br/>
                得出当n为奇数时答案为2，偶数时答案为-2</p>

            <h2 id="toc_12">D.烤烤你2</h2>

            <h3 id="toc_13">题意</h3>

            <p>给你一个包含n个数的集合<br/>
                再给你一个数y<br/>
                问你最少删掉几个数，使得集合中剩下的数的或\(!=y\)</p>

            <h3 id="toc_14">题解</h3>

            <ol>
                <li>将y转为二进制，对于每一位1，用数组记录集合中的数有多少个该位也是1。要注意的是如果y的该位是0，而数的该位是1，则直接跳过这个数。然后数组中的最小值就是答案</li>
                <li>下面代码也是差不多的思想，更短更简单</li>
            </ol>

            <h3 id="toc_15">核心代码</h3>

            <pre><code class="language-c">        memset(f,0,sizeof(f));
        scanf(&quot;%d%d&quot;,&amp;n,&amp;y);
        for(int i=0;i&lt;n;i++)
        {
            scanf(&quot;%d&quot;,&amp;m);
            //cout&lt;&lt;(m&amp;y)&lt;&lt;endl;
            if((m&amp;y)==m)
            {
                //cout&lt;&lt;m&lt;&lt;endl;
                    for(int j=0;;j++)
                {
                    if(m&lt;=0)break;
                    if(m%2)f[j]++;
                    m/=2;
                }
            }

        }
        int ans=1000000000;
        for(int i=0;;i++)
        {
            if(y&lt;=0)break;
            if(y%2)ans=min(ans,f[i]);
            y/=2;
        }
        cout&lt;&lt;ans&lt;&lt;endl;
</code></pre>

            <h1 id="toc_16">鸽了</h1>
        </div>
    </div>
</div>
{% endblock %}