"use strict";var bn=Object.create;var M=Object.defineProperty;var Sn=Object.getOwnPropertyDescriptor;var vn=Object.getOwnPropertyNames;var _n=Object.getPrototypeOf,Tn=Object.prototype.hasOwnProperty;var c=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),En=(e,t)=>{for(var r in t)M(e,r,{get:t[r],enumerable:!0})},Ee=(e,t,r,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let o of vn(t))!Tn.call(e,o)&&o!==r&&M(e,o,{get:()=>t[o],enumerable:!(n=Sn(t,o))||n.enumerable});return e};var Ie=(e,t,r)=>(r=e!=null?bn(_n(e)):{},Ee(t||!e||!e.__esModule?M(r,"default",{value:e,enumerable:!0}):r,e)),In=e=>Ee(M({},"__esModule",{value:!0}),e);var Re=c((To,Ge)=>{Ge.exports=Ce;Ce.sync=Pn;var Ae=require("fs");function An(e,t){var r=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!r||(r=r.split(";"),r.indexOf("")!==-1))return!0;for(var n=0;n<r.length;n++){var o=r[n].toLowerCase();if(o&&e.substr(-o.length).toLowerCase()===o)return!0}return!1}function Pe(e,t,r){return!e.isSymbolicLink()&&!e.isFile()?!1:An(t,r)}function Ce(e,t,r){Ae.stat(e,function(n,o){r(n,n?!1:Pe(o,e,t))})}function Pn(e,t){return Pe(Ae.statSync(e),e,t)}});var qe=c((Eo,Ne)=>{Ne.exports=Oe;Oe.sync=Cn;var Le=require("fs");function Oe(e,t,r){Le.stat(e,function(n,o){r(n,n?!1:ke(o,t))})}function Cn(e,t){return ke(Le.statSync(e),t)}function ke(e,t){return e.isFile()&&Gn(e,t)}function Gn(e,t){var r=e.mode,n=e.uid,o=e.gid,i=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),s=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),u=parseInt("010",8),l=parseInt("001",8),f=a|u,h=r&l||r&u&&o===s||r&a&&n===i||r&f&&i===0;return h}});var Ue=c((Ao,$e)=>{var Io=require("fs"),j;process.platform==="win32"||global.TESTING_WINDOWS?j=Re():j=qe();$e.exports=te;te.sync=Rn;function te(e,t,r){if(typeof t=="function"&&(r=t,t={}),!r){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(n,o){te(e,t||{},function(i,s){i?o(i):n(s)})})}j(e,t||{},function(n,o){n&&(n.code==="EACCES"||t&&t.ignoreErrors)&&(n=null,o=!1),r(n,o)})}function Rn(e,t){try{return j.sync(e,t||{})}catch(r){if(t&&t.ignoreErrors||r.code==="EACCES")return!1;throw r}}});var Ke=c((Po,He)=>{var T=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",Be=require("path"),Ln=T?";":":",Me=Ue(),je=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),Fe=(e,t)=>{let r=t.colon||Ln,n=e.match(/\//)||T&&e.match(/\\/)?[""]:[...T?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(r)],o=T?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",i=T?o.split(r):[""];return T&&e.indexOf(".")!==-1&&i[0]!==""&&i.unshift(""),{pathEnv:n,pathExt:i,pathExtExe:o}},De=(e,t,r)=>{typeof t=="function"&&(r=t,t={}),t||(t={});let{pathEnv:n,pathExt:o,pathExtExe:i}=Fe(e,t),s=[],a=l=>new Promise((f,h)=>{if(l===n.length)return t.all&&s.length?f(s):h(je(e));let m=n[l],w=/^".*"$/.test(m)?m.slice(1,-1):m,g=Be.join(w,e),x=!w&&/^\.[\\\/]/.test(e)?e.slice(0,2)+g:g;f(u(x,l,0))}),u=(l,f,h)=>new Promise((m,w)=>{if(h===o.length)return m(a(f+1));let g=o[h];Me(l+g,{pathExt:i},(x,_)=>{if(!x&&_)if(t.all)s.push(l+g);else return m(l+g);return m(u(l,f,h+1))})});return r?a(0).then(l=>r(null,l),r):a(0)},On=(e,t)=>{t=t||{};let{pathEnv:r,pathExt:n,pathExtExe:o}=Fe(e,t),i=[];for(let s=0;s<r.length;s++){let a=r[s],u=/^".*"$/.test(a)?a.slice(1,-1):a,l=Be.join(u,e),f=!u&&/^\.[\\\/]/.test(e)?e.slice(0,2)+l:l;for(let h=0;h<n.length;h++){let m=f+n[h];try{if(Me.sync(m,{pathExt:o}))if(t.all)i.push(m);else return m}catch{}}}if(t.all&&i.length)return i;if(t.nothrow)return null;throw je(e)};He.exports=De;De.sync=On});var re=c((Co,ne)=>{"use strict";var We=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(n=>n.toUpperCase()==="PATH")||"Path"};ne.exports=We;ne.exports.default=We});var Ze=c((Go,Ve)=>{"use strict";var Xe=require("path"),kn=Ke(),Nn=re();function ze(e,t){let r=e.options.env||process.env,n=process.cwd(),o=e.options.cwd!=null,i=o&&process.chdir!==void 0&&!process.chdir.disabled;if(i)try{process.chdir(e.options.cwd)}catch{}let s;try{s=kn.sync(e.command,{path:r[Nn({env:r})],pathExt:t?Xe.delimiter:void 0})}catch{}finally{i&&process.chdir(n)}return s&&(s=Xe.resolve(o?e.options.cwd:"",s)),s}function qn(e){return ze(e)||ze(e,!0)}Ve.exports=qn});var Ye=c((Ro,ie)=>{"use strict";var oe=/([()\][%!^"`<>&|;, *?])/g;function $n(e){return e=e.replace(oe,"^$1"),e}function Un(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(oe,"^$1"),t&&(e=e.replace(oe,"^$1")),e}ie.exports.command=$n;ie.exports.argument=Un});var Qe=c((Lo,Je)=>{"use strict";Je.exports=/^#!(.*)/});var tt=c((Oo,et)=>{"use strict";var Bn=Qe();et.exports=(e="")=>{let t=e.match(Bn);if(!t)return null;let[r,n]=t[0].replace(/#! ?/,"").split(" "),o=r.split("/").pop();return o==="env"?n:n?`${o} ${n}`:o}});var rt=c((ko,nt)=>{"use strict";var se=require("fs"),Mn=tt();function jn(e){let r=Buffer.alloc(150),n;try{n=se.openSync(e,"r"),se.readSync(n,r,0,150,0),se.closeSync(n)}catch{}return Mn(r.toString())}nt.exports=jn});var at=c((No,st)=>{"use strict";var Fn=require("path"),ot=Ze(),it=Ye(),Dn=rt(),Hn=process.platform==="win32",Kn=/\.(?:com|exe)$/i,Wn=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function Xn(e){e.file=ot(e);let t=e.file&&Dn(e.file);return t?(e.args.unshift(e.file),e.command=t,ot(e)):e.file}function zn(e){if(!Hn)return e;let t=Xn(e),r=!Kn.test(t);if(e.options.forceShell||r){let n=Wn.test(t);e.command=Fn.normalize(e.command),e.command=it.command(e.command),e.args=e.args.map(i=>it.argument(i,n));let o=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${o}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Vn(e,t,r){t&&!Array.isArray(t)&&(r=t,t=null),t=t?t.slice(0):[],r=Object.assign({},r);let n={command:e,args:t,options:r,file:void 0,original:{command:e,args:t}};return r.shell?n:zn(n)}st.exports=Vn});var lt=c((qo,ut)=>{"use strict";var ae=process.platform==="win32";function ce(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Zn(e,t){if(!ae)return;let r=e.emit;e.emit=function(n,o){if(n==="exit"){let i=ct(o,t,"spawn");if(i)return r.call(e,"error",i)}return r.apply(e,arguments)}}function ct(e,t){return ae&&e===1&&!t.file?ce(t.original,"spawn"):null}function Yn(e,t){return ae&&e===1&&!t.file?ce(t.original,"spawnSync"):null}ut.exports={hookChildProcess:Zn,verifyENOENT:ct,verifyENOENTSync:Yn,notFoundError:ce}});var pt=c(($o,E)=>{"use strict";var dt=require("child_process"),ue=at(),le=lt();function ft(e,t,r){let n=ue(e,t,r),o=dt.spawn(n.command,n.args,n.options);return le.hookChildProcess(o,n),o}function Jn(e,t,r){let n=ue(e,t,r),o=dt.spawnSync(n.command,n.args,n.options);return o.error=o.error||le.verifyENOENTSync(o.status,n),o}E.exports=ft;E.exports.spawn=ft;E.exports.sync=Jn;E.exports._parse=ue;E.exports._enoent=le});var ht=c((Uo,mt)=>{"use strict";mt.exports=e=>{let t=typeof e=="string"?`
`:`
`.charCodeAt(),r=typeof e=="string"?"\r":"\r".charCodeAt();return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===r&&(e=e.slice(0,e.length-1)),e}});var xt=c((Bo,k)=>{"use strict";var O=require("path"),wt=re(),gt=e=>{e={cwd:process.cwd(),path:process.env[wt()],execPath:process.execPath,...e};let t,r=O.resolve(e.cwd),n=[];for(;t!==r;)n.push(O.join(r,"node_modules/.bin")),t=r,r=O.resolve(r,"..");let o=O.resolve(e.cwd,e.execPath,"..");return n.push(o),n.concat(e.path).join(O.delimiter)};k.exports=gt;k.exports.default=gt;k.exports.env=e=>{e={env:process.env,...e};let t={...e.env},r=wt({env:t});return e.path=t[r],t[r]=k.exports(e),t}});var bt=c((Mo,de)=>{"use strict";var yt=(e,t)=>{for(let r of Reflect.ownKeys(t))Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(t,r));return e};de.exports=yt;de.exports.default=yt});var vt=c((jo,D)=>{"use strict";var Qn=bt(),F=new WeakMap,St=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let r,n=0,o=e.displayName||e.name||"<anonymous>",i=function(...s){if(F.set(i,++n),n===1)r=e.apply(this,s),e=null;else if(t.throw===!0)throw new Error(`Function \`${o}\` can only be called once`);return r};return Qn(i,e),F.set(i,n),i};D.exports=St;D.exports.default=St;D.exports.callCount=e=>{if(!F.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return F.get(e)}});var _t=c(H=>{"use strict";Object.defineProperty(H,"__esModule",{value:!0});H.SIGNALS=void 0;var er=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];H.SIGNALS=er});var fe=c(I=>{"use strict";Object.defineProperty(I,"__esModule",{value:!0});I.SIGRTMAX=I.getRealtimeSignals=void 0;var tr=function(){let e=Et-Tt+1;return Array.from({length:e},nr)};I.getRealtimeSignals=tr;var nr=function(e,t){return{name:`SIGRT${t+1}`,number:Tt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},Tt=34,Et=64;I.SIGRTMAX=Et});var It=c(K=>{"use strict";Object.defineProperty(K,"__esModule",{value:!0});K.getSignals=void 0;var rr=require("os"),or=_t(),ir=fe(),sr=function(){let e=(0,ir.getRealtimeSignals)();return[...or.SIGNALS,...e].map(ar)};K.getSignals=sr;var ar=function({name:e,number:t,description:r,action:n,forced:o=!1,standard:i}){let{signals:{[e]:s}}=rr.constants,a=s!==void 0;return{name:e,number:a?s:t,description:r,supported:a,action:n,forced:o,standard:i}}});var Pt=c(A=>{"use strict";Object.defineProperty(A,"__esModule",{value:!0});A.signalsByNumber=A.signalsByName=void 0;var cr=require("os"),At=It(),ur=fe(),lr=function(){return(0,At.getSignals)().reduce(dr,{})},dr=function(e,{name:t,number:r,description:n,supported:o,action:i,forced:s,standard:a}){return{...e,[t]:{name:t,number:r,description:n,supported:o,action:i,forced:s,standard:a}}},fr=lr();A.signalsByName=fr;var pr=function(){let e=(0,At.getSignals)(),t=ur.SIGRTMAX+1,r=Array.from({length:t},(n,o)=>mr(o,e));return Object.assign({},...r)},mr=function(e,t){let r=hr(e,t);if(r===void 0)return{};let{name:n,description:o,supported:i,action:s,forced:a,standard:u}=r;return{[e]:{name:n,number:e,description:o,supported:i,action:s,forced:a,standard:u}}},hr=function(e,t){let r=t.find(({name:n})=>cr.constants.signals[n]===e);return r!==void 0?r:t.find(n=>n.number===e)},wr=pr();A.signalsByNumber=wr});var Gt=c((Wo,Ct)=>{"use strict";var{signalsByName:gr}=Pt(),xr=({timedOut:e,timeout:t,errorCode:r,signal:n,signalDescription:o,exitCode:i,isCanceled:s})=>e?`timed out after ${t} milliseconds`:s?"was canceled":r!==void 0?`failed with ${r}`:n!==void 0?`was killed with ${n} (${o})`:i!==void 0?`failed with exit code ${i}`:"failed",yr=({stdout:e,stderr:t,all:r,error:n,signal:o,exitCode:i,command:s,escapedCommand:a,timedOut:u,isCanceled:l,killed:f,parsed:{options:{timeout:h}}})=>{i=i===null?void 0:i,o=o===null?void 0:o;let m=o===void 0?void 0:gr[o].description,w=n&&n.code,x=`Command ${xr({timedOut:u,timeout:h,errorCode:w,signal:o,signalDescription:m,exitCode:i,isCanceled:l})}: ${s}`,_=Object.prototype.toString.call(n)==="[object Error]",U=_?`${x}
${n.message}`:x,B=[U,t,e].filter(Boolean).join(`
`);return _?(n.originalMessage=n.message,n.message=B):n=new Error(B),n.shortMessage=U,n.command=s,n.escapedCommand=a,n.exitCode=i,n.signal=o,n.signalDescription=m,n.stdout=e,n.stderr=t,r!==void 0&&(n.all=r),"bufferedData"in n&&delete n.bufferedData,n.failed=!0,n.timedOut=!!u,n.isCanceled=l,n.killed=f&&!u,n};Ct.exports=yr});var Lt=c((Xo,pe)=>{"use strict";var W=["stdin","stdout","stderr"],br=e=>W.some(t=>e[t]!==void 0),Rt=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return W.map(n=>e[n]);if(br(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${W.map(n=>`\`${n}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let r=Math.max(t.length,W.length);return Array.from({length:r},(n,o)=>t[o])};pe.exports=Rt;pe.exports.node=e=>{let t=Rt(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var Ot=c((zo,X)=>{X.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&X.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&X.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var Ut=c((Vo,G)=>{var d=global.process,b=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};b(d)?(kt=require("assert"),P=Ot(),Nt=/^win/i.test(d.platform),N=require("events"),typeof N!="function"&&(N=N.EventEmitter),d.__signal_exit_emitter__?p=d.__signal_exit_emitter__:(p=d.__signal_exit_emitter__=new N,p.count=0,p.emitted={}),p.infinite||(p.setMaxListeners(1/0),p.infinite=!0),G.exports=function(e,t){if(!b(global.process))return function(){};kt.equal(typeof e,"function","a callback must be provided for exit handler"),C===!1&&me();var r="exit";t&&t.alwaysLast&&(r="afterexit");var n=function(){p.removeListener(r,e),p.listeners("exit").length===0&&p.listeners("afterexit").length===0&&z()};return p.on(r,e),n},z=function(){!C||!b(global.process)||(C=!1,P.forEach(function(t){try{d.removeListener(t,V[t])}catch{}}),d.emit=Z,d.reallyExit=he,p.count-=1)},G.exports.unload=z,S=function(t,r,n){p.emitted[t]||(p.emitted[t]=!0,p.emit(t,r,n))},V={},P.forEach(function(e){V[e]=function(){if(b(global.process)){var r=d.listeners(e);r.length===p.count&&(z(),S("exit",null,e),S("afterexit",null,e),Nt&&e==="SIGHUP"&&(e="SIGINT"),d.kill(d.pid,e))}}}),G.exports.signals=function(){return P},C=!1,me=function(){C||!b(global.process)||(C=!0,p.count+=1,P=P.filter(function(t){try{return d.on(t,V[t]),!0}catch{return!1}}),d.emit=$t,d.reallyExit=qt)},G.exports.load=me,he=d.reallyExit,qt=function(t){b(global.process)&&(d.exitCode=t||0,S("exit",d.exitCode,null),S("afterexit",d.exitCode,null),he.call(d,d.exitCode))},Z=d.emit,$t=function(t,r){if(t==="exit"&&b(global.process)){r!==void 0&&(d.exitCode=r);var n=Z.apply(this,arguments);return S("exit",d.exitCode,null),S("afterexit",d.exitCode,null),n}else return Z.apply(this,arguments)}):G.exports=function(){return function(){}};var kt,P,Nt,N,p,z,S,V,C,me,he,qt,Z,$t});var Mt=c((Zo,Bt)=>{"use strict";var Sr=require("os"),vr=Ut(),_r=1e3*5,Tr=(e,t="SIGTERM",r={})=>{let n=e(t);return Er(e,t,r,n),n},Er=(e,t,r,n)=>{if(!Ir(t,r,n))return;let o=Pr(r),i=setTimeout(()=>{e("SIGKILL")},o);i.unref&&i.unref()},Ir=(e,{forceKillAfterTimeout:t},r)=>Ar(e)&&t!==!1&&r,Ar=e=>e===Sr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",Pr=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return _r;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},Cr=(e,t)=>{e.kill()&&(t.isCanceled=!0)},Gr=(e,t,r)=>{e.kill(t),r(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},Rr=(e,{timeout:t,killSignal:r="SIGTERM"},n)=>{if(t===0||t===void 0)return n;let o,i=new Promise((a,u)=>{o=setTimeout(()=>{Gr(e,r,u)},t)}),s=n.finally(()=>{clearTimeout(o)});return Promise.race([i,s])},Lr=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},Or=async(e,{cleanup:t,detached:r},n)=>{if(!t||r)return n;let o=vr(()=>{e.kill()});return n.finally(()=>{o()})};Bt.exports={spawnedKill:Tr,spawnedCancel:Cr,setupTimeout:Rr,validateTimeout:Lr,setExitHandler:Or}});var Ft=c((Yo,jt)=>{"use strict";var y=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";y.writable=e=>y(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";y.readable=e=>y(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";y.duplex=e=>y.writable(e)&&y.readable(e);y.transform=e=>y.duplex(e)&&typeof e._transform=="function";jt.exports=y});var Ht=c((Jo,Dt)=>{"use strict";var{PassThrough:kr}=require("stream");Dt.exports=e=>{e={...e};let{array:t}=e,{encoding:r}=e,n=r==="buffer",o=!1;t?o=!(r||n):r=r||"utf8",n&&(r=null);let i=new kr({objectMode:o});r&&i.setEncoding(r);let s=0,a=[];return i.on("data",u=>{a.push(u),o?s=a.length:s+=u.length}),i.getBufferedValue=()=>t?a:n?Buffer.concat(a,s):a.join(""),i.getBufferedLength=()=>s,i}});var Kt=c((Qo,q)=>{"use strict";var{constants:Nr}=require("buffer"),qr=require("stream"),{promisify:$r}=require("util"),Ur=Ht(),Br=$r(qr.pipeline),Y=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function we(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:r}=t,n=Ur(t);return await new Promise((o,i)=>{let s=a=>{a&&n.getBufferedLength()<=Nr.MAX_LENGTH&&(a.bufferedData=n.getBufferedValue()),i(a)};(async()=>{try{await Br(e,n),o()}catch(a){s(a)}})(),n.on("data",()=>{n.getBufferedLength()>r&&s(new Y)})}),n.getBufferedValue()}q.exports=we;q.exports.buffer=(e,t)=>we(e,{...t,encoding:"buffer"});q.exports.array=(e,t)=>we(e,{...t,array:!0});q.exports.MaxBufferError=Y});var Xt=c((ei,Wt)=>{"use strict";var{PassThrough:Mr}=require("stream");Wt.exports=function(){var e=[],t=new Mr({objectMode:!0});return t.setMaxListeners(0),t.add=r,t.isEmpty=n,t.on("unpipe",o),Array.prototype.slice.call(arguments).forEach(r),t;function r(i){return Array.isArray(i)?(i.forEach(r),this):(e.push(i),i.once("end",o.bind(null,i)),i.once("error",t.emit.bind(t,"error")),i.pipe(t,{end:!1}),this)}function n(){return e.length==0}function o(i){e=e.filter(function(s){return s!==i}),!e.length&&t.readable&&t.end()}}});var Yt=c((ti,Zt)=>{"use strict";var Vt=Ft(),zt=Kt(),jr=Xt(),Fr=(e,t)=>{t===void 0||e.stdin===void 0||(Vt(t)?t.pipe(e.stdin):e.stdin.end(t))},Dr=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let r=jr();return e.stdout&&r.add(e.stdout),e.stderr&&r.add(e.stderr),r},ge=async(e,t)=>{if(e){e.destroy();try{return await t}catch(r){return r.bufferedData}}},xe=(e,{encoding:t,buffer:r,maxBuffer:n})=>{if(!(!e||!r))return t?zt(e,{encoding:t,maxBuffer:n}):zt.buffer(e,{maxBuffer:n})},Hr=async({stdout:e,stderr:t,all:r},{encoding:n,buffer:o,maxBuffer:i},s)=>{let a=xe(e,{encoding:n,buffer:o,maxBuffer:i}),u=xe(t,{encoding:n,buffer:o,maxBuffer:i}),l=xe(r,{encoding:n,buffer:o,maxBuffer:i*2});try{return await Promise.all([s,a,u,l])}catch(f){return Promise.all([{error:f,signal:f.signal,timedOut:f.timedOut},ge(e,a),ge(t,u),ge(r,l)])}},Kr=({input:e})=>{if(Vt(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};Zt.exports={handleInput:Fr,makeAllStream:Dr,getSpawnedResult:Hr,validateInputSync:Kr}});var Qt=c((ni,Jt)=>{"use strict";var Wr=(async()=>{})().constructor.prototype,Xr=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(Wr,e)]),zr=(e,t)=>{for(let[r,n]of Xr){let o=typeof t=="function"?(...i)=>Reflect.apply(n.value,t(),i):n.value.bind(t);Reflect.defineProperty(e,r,{...n,value:o})}return e},Vr=e=>new Promise((t,r)=>{e.on("exit",(n,o)=>{t({exitCode:n,signal:o})}),e.on("error",n=>{r(n)}),e.stdin&&e.stdin.on("error",n=>{r(n)})});Jt.exports={mergePromise:zr,getSpawnedPromise:Vr}});var nn=c((ri,tn)=>{"use strict";var en=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],Zr=/^[\w.-]+$/,Yr=/"/g,Jr=e=>typeof e!="string"||Zr.test(e)?e:`"${e.replace(Yr,'\\"')}"`,Qr=(e,t)=>en(e,t).join(" "),eo=(e,t)=>en(e,t).map(r=>Jr(r)).join(" "),to=/ +/g,no=e=>{let t=[];for(let r of e.trim().split(to)){let n=t[t.length-1];n&&n.endsWith("\\")?t[t.length-1]=`${n.slice(0,-1)} ${r}`:t.push(r)}return t};tn.exports={joinCommand:Qr,getEscapedCommand:eo,parseCommand:no}});var ln=c((oi,R)=>{"use strict";var ro=require("path"),ye=require("child_process"),oo=pt(),io=ht(),so=xt(),ao=vt(),J=Gt(),on=Lt(),{spawnedKill:co,spawnedCancel:uo,setupTimeout:lo,validateTimeout:fo,setExitHandler:po}=Mt(),{handleInput:mo,getSpawnedResult:ho,makeAllStream:wo,validateInputSync:go}=Yt(),{mergePromise:rn,getSpawnedPromise:xo}=Qt(),{joinCommand:sn,parseCommand:an,getEscapedCommand:cn}=nn(),yo=1e3*1e3*100,bo=({env:e,extendEnv:t,preferLocal:r,localDir:n,execPath:o})=>{let i=t?{...process.env,...e}:e;return r?so.env({env:i,cwd:n,execPath:o}):i},un=(e,t,r={})=>{let n=oo._parse(e,t,r);return e=n.command,t=n.args,r=n.options,r={maxBuffer:yo,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:r.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...r},r.env=bo(r),r.stdio=on(r),process.platform==="win32"&&ro.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:r,parsed:n}},$=(e,t,r)=>typeof t!="string"&&!Buffer.isBuffer(t)?r===void 0?void 0:"":e.stripFinalNewline?io(t):t,Q=(e,t,r)=>{let n=un(e,t,r),o=sn(e,t),i=cn(e,t);fo(n.options);let s;try{s=ye.spawn(n.file,n.args,n.options)}catch(w){let g=new ye.ChildProcess,x=Promise.reject(J({error:w,stdout:"",stderr:"",all:"",command:o,escapedCommand:i,parsed:n,timedOut:!1,isCanceled:!1,killed:!1}));return rn(g,x)}let a=xo(s),u=lo(s,n.options,a),l=po(s,n.options,u),f={isCanceled:!1};s.kill=co.bind(null,s.kill.bind(s)),s.cancel=uo.bind(null,s,f);let m=ao(async()=>{let[{error:w,exitCode:g,signal:x,timedOut:_},U,B,yn]=await ho(s,n.options,l),Se=$(n.options,U),ve=$(n.options,B),_e=$(n.options,yn);if(w||g!==0||x!==null){let Te=J({error:w,exitCode:g,signal:x,stdout:Se,stderr:ve,all:_e,command:o,escapedCommand:i,parsed:n,timedOut:_,isCanceled:f.isCanceled,killed:s.killed});if(!n.options.reject)return Te;throw Te}return{command:o,escapedCommand:i,exitCode:0,stdout:Se,stderr:ve,all:_e,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return mo(s,n.options.input),s.all=wo(s,n.options),rn(s,m)};R.exports=Q;R.exports.sync=(e,t,r)=>{let n=un(e,t,r),o=sn(e,t),i=cn(e,t);go(n.options);let s;try{s=ye.spawnSync(n.file,n.args,n.options)}catch(l){throw J({error:l,stdout:"",stderr:"",all:"",command:o,escapedCommand:i,parsed:n,timedOut:!1,isCanceled:!1,killed:!1})}let a=$(n.options,s.stdout,s.error),u=$(n.options,s.stderr,s.error);if(s.error||s.status!==0||s.signal!==null){let l=J({stdout:a,stderr:u,error:s.error,signal:s.signal,exitCode:s.status,command:o,escapedCommand:i,parsed:n,timedOut:s.error&&s.error.code==="ETIMEDOUT",isCanceled:!1,killed:s.signal!==null});if(!n.options.reject)return l;throw l}return{command:o,escapedCommand:i,exitCode:0,stdout:a,stderr:u,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};R.exports.command=(e,t)=>{let[r,...n]=an(e);return Q(r,n,t)};R.exports.commandSync=(e,t)=>{let[r,...n]=an(e);return Q.sync(r,n,t)};R.exports.node=(e,t,r={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(r=t,t=[]);let n=on.node(r),o=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:i=process.execPath,nodeOptions:s=o}=r;return Q(i,[...s,e,...Array.isArray(t)?t:[]],{...r,stdin:void 0,stdout:void 0,stderr:void 0,stdio:n,shell:!1})}});var vo={};En(vo,{config:()=>gn,default:()=>xn});module.exports=In(vo);var L=require("@raycast/api");var dn=Ie(require("node:process"),1),fn=Ie(ln(),1);async function pn(e,{humanReadableOutput:t=!0}={}){if(dn.default.platform!=="darwin")throw new Error("macOS only");let r=t?[]:["-ss"],{stdout:n}=await(0,fn.default)("osascript",["-e",e,r]);return n}async function mn(e){await pn(`
    tell application "Arc"
      make new tab with properties {URL:"${e}"}

      activate
    end tell
  `)}var ee=require("@raycast/api"),ci=(0,ee.getPreferenceValues)(),So=(0,ee.getPreferenceValues)(),be=(0,ee.getPreferenceValues)();var v=require("@raycast/api");async function hn(e){let t=/(http(s)?:\/\/|arc:\/\/)?(www\.)?[-a-zA-Z0-9@:%._+~#=]{0,256}(\.[a-z]{2,6})?\b([-a-zA-Z0-9@:%_+.~#?&//=]*)/;return e===void 0||e===""?(await(0,v.showHUD)("\u274C No URL found"),!1):t.test(e)?!0:(await(0,v.showHUD)("\u274C Invalid URL provided"),!1)}function wn(e){return/^(?:(?:https?|ftp):\/\/)?(?:\w+\.)+\w{2,}|localhost[:?\d]*(?:\/|$)/.test(e)}var gn={google:"https://www.google.com/search?q=",duckduckgo:"https://www.duckduckgo.com?q=",bing:"https://www.bing.com/search?q=",yahoo:"https://search.yahoo.com/search?p=",ecosia:"https://www.ecosia.org/search?q="};async function xn(e){let{url:t}=e.arguments,{fallbackText:r}=e,n=await(0,L.getSelectedText)(),o=`${gn[be.engine]}${encodeURIComponent(n)}`,i=t||n?wn(n)?n:o:r||be.url;try{if(await hn(i)){let s=/^\S+?:\/\//i.test(i)?i:"https://"+i;await(0,L.closeMainWindow)(),await mn(s)}}catch(s){console.error(s),await(0,L.showHUD)("\u274C Failed opening a new little arc window.")}}0&&(module.exports={config});
