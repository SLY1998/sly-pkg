#!/usr/bin/env sh

# 设置脚本执行环境
set -e

# 定义颜色和格式化输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo "${RED}[ERROR]${NC} $1"
}

# 执行命令并检查结果
exec_cmd() {
    local cmd="$1"
    local desc="$2"
    
    log_info "$desc: $cmd"
    
    if eval "$cmd"; then
        log_success "$desc 成功"
        return 0
    else
        log_error "$desc 失败"
        return 1
    fi
}

# 构建项目
build_project() {
    log_info "开始构建项目..."
    exec_cmd "pnpm run build" "构建项目"
}

# 提交代码到Git
commit_code() {
    local commit_msg="$1"
    
    log_info "开始提交代码..."
    exec_cmd "git add -A" "添加更改"
    exec_cmd "git commit -m '$commit_msg'" "提交更改"
    exec_cmd "git pull --rebase" "拉取最新代码"
    exec_cmd "git push" "推送代码"
}

# 更新版本号
update_version() {
    local version_type="$1"
    
    log_info "开始更新版本号..."
    exec_cmd "npm version $version_type" "更新版本号 ($version_type)"
}

# 发布到NPM
publish_to_npm() {
    log_info "开始发布到NPM..."
    exec_cmd "npm publish" "发布到NPM"
}

# 交互式确认
confirm_action() {
    local action="$1"
    
    log_warning "即将执行: $action"
    read -p "确认执行? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_info "操作已取消"
        return 1
    fi
    
    return 0
}

# 主函数
main() {
    local version_type="patch"  # 默认更新补丁版本
    local commit_msg="publish"  # 默认提交消息
    
    # 解析命令行参数
    while [[ $# -gt 0 ]]; do
        case $1 in
            -v|--version)
                version_type="$2"
                shift # 移除参数名
                shift # 移除参数值
                ;;
            -m|--message)
                commit_msg="$2"
                shift # 移除参数名
                shift # 移除参数值
                ;;
            *)
                log_warning "未知参数: $1"
                shift
                ;;
        esac
    done
    
    log_info "===== 开始发布流程 ====="
    log_info "版本更新类型: $version_type"
    log_info "提交消息: $commit_msg"
    
    # 确认执行
    if ! confirm_action "完整发布流程 (构建 -> 提交代码 -> 更新版本 -> 发布)"; then
        exit 0
    fi
    
    # 执行发布流程
    build_project || exit 1
    commit_code "$commit_msg" || exit 1
    update_version "$version_type" || exit 1
    publish_to_npm || exit 1
    
    log_success "===== 发布流程完成 ====="
}

# 执行主函数
main "$@"


